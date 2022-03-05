package config

//import "github.com/krehermann/cue-demo/config"
//import "hack.com/config"
import "github.com/krehermann/cue-demo-mod/config"

#config: config.#Config & {
    app: config.#App & {
        host: "mydomain.com"
        port: 443
        workers: 2
        dsn: "root:test@tcp(mysql.domain.com:3306)/test?charset=utf8&parseTime=True&loc=Local"
    }
}

#config