package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/mattn/go-sqlite3"

	"myblog/models"
	_ "myblog/routers"
)

func init() {
	orm.RegisterDriver("sqlite3", orm.DRSqlite)

	orm.RegisterDataBase("default", "sqlite3", "myblog.db")

}

func main() {

	orm.RunSyncdb("default", false, true)
	orm.Debug = true

	o := orm.NewOrm()
	o.Using("default")

	category := new(models.Category)
	topic := new(models.Topic)

	o.Insert(category)
	o.Insert(topic)

	beego.Run()
}
