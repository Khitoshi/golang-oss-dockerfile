imageを作成
`$docker build -t [containername]:latest .`

コンテナ起動&作成
`$docker run -it --name [containername] -v [containername]:/app/src [containername] bash`

コンテナ起動
`$docker start -ai [containername]`