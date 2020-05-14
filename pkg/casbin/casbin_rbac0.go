package casbin

import (
	"casbindemo/config"
	"casbindemo/logger"
	"casbindemo/model"
	"github.com/casbin/casbin/v2"
	"github.com/casbin/gorm-adapter/v2"
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
	"os"
)

// 鉴权
func Authentication(ctx *gin.Context) {
	data, _ := ctx.Get("role")
	role := data.(string)

	e, err := initCasbin()
	if err != nil {
		logger.Logger.Panic("初始化 Casbin 出现错误：", err)
	}
	ok, err := e.Enforce(role, ctx.FullPath(), ctx.Request.Method)
	logger.Logger.Warnf("sub:[%s] obj:[%s] act:[%s] res:[%t]", role, ctx.FullPath(), ctx.Request.Method, ok)
	if err != nil {
		logger.Logger.Panic("执行 e.Enforce() 出错：", err)
	}
	if ok {
		ctx.Next()
	} else {
		ctx.JSON(403, gin.H{
			"code": 403,
			"msg":  "权限不足",
		})
		ctx.Abort()
	}
}

// 初始化 casbin
func initCasbin() (e *casbin.Enforcer, err error) {
	adapter, err := gormadapter.NewAdapterByDB(model.Db)
	if err != nil {
		return
	}

	if config.CasbinConfig.Path == "" {
		wd, _ := os.Getwd()
		config.CasbinConfig.Path = wd + "/rbac_model.conf"
	}
	e, err = casbin.NewEnforcer(config.CasbinConfig.Path, adapter)
	if err != nil {
		return
	}

	if err = e.LoadPolicy(); err != nil {
		return
	}

	logrus.Debugf("initCasbin *casbin.Enforcer")
	logrus.Debugf("e=%+v", e)
	logrus.Debugf("e.GetModel()=%+v", e.GetModel())

	logrus.Debugf("e.GetModel()[e][e]=%+v", e.GetModel()["e"]["e"])
	logrus.Debugf("e.GetModel()[g][g]=%+v", e.GetModel()["g"]["g"])
	logrus.Debugf("e.GetModel()[m][m]=%+v", e.GetModel()["m"]["m"])
	logrus.Debugf("e.GetModel()[p][p]=%+v", e.GetModel()["p"]["p"])
	logrus.Debugf("e.GetModel()[r][r]=%+v", e.GetModel()["r"]["r"])

	logrus.Debugf("e.GetAdapter()=%+v", e.GetAdapter())

	return
}
