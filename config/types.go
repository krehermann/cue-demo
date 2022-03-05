package config

type Config struct {
	App App `json:"app"`
}

type App struct {
	Host    string `json:"host"`
	Port    int    `json:"port"`
	Workers int    `json:"workers"`
	DSN     string `json:"dsn"`
}
