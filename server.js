// importar um pacote nativo do Node.js
const http = require("node:http");
const hostname = "127.0.0.1";
const port = 3000;
// criar um servidor
const server = http.createServer((req, res) => {
    //define que o retorno terá sucesso
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/plain");
    res.end("Hello World\n");

});

server.listen(port, hostname,()=>{
console.log(`Servidor rodando em http://${hostname}:${port}/`);
})