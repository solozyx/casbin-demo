package route

import (
	"github.com/gin-gonic/gin"

	"casbindemo/conf"
	"casbindemo/config"
	"casbindemo/controller"
	"casbindemo/pkg/casbin"
)

func Setup() *gin.Engine {
	gin.SetMode(config.ApplicationConfig.Env)
	router := gin.Default()

	// 假设登录,一般都用JWT,这里假设从JWT中解析了角色(用户)
	router.Use(func(ctx *gin.Context) {
		role := ctx.Request.Header.Get("Authority")
		// role是sub的抽象,在RBAC中role为角色,在ACL中role为用户
		ctx.Set(conf.Role, role)
		ctx.Next()
	})

	// casbin 权限验证
	router.Use(casbin.Authentication)

	// 查询列表
	router.GET("/news", controller.GetNewsList)
	// 查询单条
	router.GET("/news/:id", controller.GetNewsDetail)
	// 新增
	router.POST("/news", controller.AddNews)
	// 修改
	router.PUT("/news/:id", controller.EditNews)
	// 删除
	router.DELETE("/news/:id", controller.DelNews)

	return router
}
