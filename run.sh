function free_port()
{
    echo $(netstat -atn | perl -0777 -ne \
        '@ports = /tcp.*?\:(\d+)\s+/imsg ;
        for $port ('$1'..'$2') {
            if(!grep(/^$port$/, @ports)) {
                print $port; last
            }
        }')
}
PORT=$(free_port 50501 50999)
echo "RUN http://0.0.0.0:$PORT"
docker run -it --rm --name hshyunsookim.github.io.$PORT -p $PORT:80 -v "$PWD/_site":/usr/local/apache2/htdocs/ httpd:2.4

