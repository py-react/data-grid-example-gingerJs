
async def meta_data():
    return {
        "title": "Ginger-Js",
        "description": "Some Description",
        "og:description": "Description Here",
        "og:image": "/static/images/test.jpeg",
        "icon":"/static/images/favicon.ico"
    }

async def index(request):
    return {}