package controller

import (
	"github.com/gin-gonic/gin"

	"casbindemo/conf"
	"casbindemo/logger"
)

// 获取所有
func GetNewsList(ctx *gin.Context) {
	role, _ := ctx.Get(conf.Role)
	roleStr := role.(string)
	logger.Logger.Warnf("[%s] 操作了 [GetNewsList() ]", roleStr)
	normal(ctx)
}

// 获取单条
func GetNewsDetail(ctx *gin.Context) {
	role, _ := ctx.Get(conf.Role)
	roleStr := role.(string)
	logger.Logger.Warnf("[%s] 操作了 [GetNewsDetail() ]", roleStr)
	normal(ctx)
}

// 添加
func AddNews(ctx *gin.Context) {
	role, _ := ctx.Get(conf.Role)
	roleStr := role.(string)
	logger.Logger.Warnf("[%s] 操作了 [ AddNews() ]", roleStr)
	normal(ctx)
}

// 编辑
func EditNews(ctx *gin.Context) {
	role, _ := ctx.Get(conf.Role)
	roleStr := role.(string)
	logger.Logger.Warnf("[%s] 操作了 [EditNews() ]", roleStr)
	normal(ctx)
}

// 删除
func DelNews(ctx *gin.Context) {
	role, _ := ctx.Get(conf.Role)
	roleStr := role.(string)
	logger.Logger.Warnf("[%s] 操作了 [ DelNews() ]", roleStr)
	normal(ctx)
}

func normal(ctx *gin.Context) {
	ctx.JSON(0, gin.H{
		"code": 0,
		"msg":  "normal",
	})
}
