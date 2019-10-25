#!/usr/bin/env python3
from aiohttp import web
import socketio

sio = socketio.AsyncServer(cors_allowed_origins='*')
app = web.Application()
sio.attach(app)

async def index(request):
    return web.Response(text="Hello!", content_type='text/html')

@sio.event
def connect(sid, environ):
    print("connect ", sid)

@sio.event
async def message(sid, data):
    print("received ", data)
    await sio.emit('message', data=data + ' to you too!')

@sio.event
def disconnect(sid):
    print('disconnect ', sid)

app.router.add_get('/', index)

if __name__ == '__main__':
    web.run_app(app, port=3000)
