package db 

import(
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5/pgxpool"
    "github.com/joho/godotenv"
)

var DB *pgxpool.Pool

func InitPostgress() error {
	_=godotenv.Load()

	dbURL:= fmt.Sprintf(
		 "postgres://%s:%s@%s:%s/%s?sslmode=disable",
        os.Getenv("POSTGRES_USER"),
        os.Getenv("POSTGRES_PASSWORD"),
        os.Getenv("POSTGRES_HOST"),
        os.Getenv("POSTGRES_PORT"),
        os.Getenv("POSTGRES_DB"),
	)
	pool, err := pgxpool.New(context.Background(), dbURL)
	if err != nil {
		return err
	}

	DB = pool 
	return nil
}