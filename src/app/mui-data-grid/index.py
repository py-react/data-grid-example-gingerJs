

async def meta_data():
    return {
        "title": "Material UI Data grid Example",
        "description": "Some Description",
    }

async def index(request):
    # Define initial rows as a list of dictionaries
    rows = [
        { 'id': 1, 'col1': 'Hello', 'col2': 'World' },
        { 'id': 2, 'col1': 'DataGridPro', 'col2': 'is Awesome' },
        { 'id': 3, 'col1': 'MUI', 'col2': 'is Amazing' },
    ]

    # Generate additional 47 items to make the total count 50
    for i in range(4, 51):
        rows.append({ 'id': i, 'col1': f'Item {i}', 'col2': f'Description {i}' })

    # Define columns as a list of dictionaries
    columns = [
        { 'field': 'col1', 'headerName': 'Column 1', 'width': 150 },
        { 'field': 'col2', 'headerName': 'Column 2', 'width': 150 },
    ]
    return {"rows":rows,"columns":columns}