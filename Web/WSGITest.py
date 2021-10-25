from wsgiref.simple_server import make_server

def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')]) # header, response code and header content
    return [b'<h1>Hello, web!</h1>'] # body

# create a http server
httpd = make_server('', 8000, application)
print("Serving HTTP on port 8000...")
httpd.serve_forever()