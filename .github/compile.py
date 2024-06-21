import requests

url_raw = 'luac.mtasa.com'
url = f'https://{url_raw}'
url_file = f'{url}/index.php'

newLine = '\r\n'
boundary = '------WebKitFormBoundary'
boundaryLine = f'{boundary}{newLine}'

headers = {
    'Host': url_raw,
    'Origin': url,
    'Referer': url_file,
    'Content-Type': f'multipart/form-data; boundary={boundary[2:]}',
}

fileContent = 'print("Hello, World!")'
fileName = 'main.lua'
docompile = 1
obfuscateLevel = 3
debug = 1


def req() -> requests.Response:
    payload = [
        [
            f'Content-Disposition: form-data; name="luasource"; filename="{fileName}"'.encode('utf-8'),
            b'Content-Type: application/octet-stream',
            f'{newLine}{fileContent}'.encode('utf-8')
        ],
        [
            b'Content-Disposition: form-data; name="compile"',
            f'{newLine}{docompile}'.encode('utf-8')
        ],
        [
            b'Content-Disposition: form-data; name="obfuscate"',
            f'{newLine}{obfuscateLevel}'.encode('utf-8')
        ],
        [
            b'Content-Disposition: form-data; name="debug"',
            f'{newLine}{debug}'.encode('utf-8')
        ],
        [
            b'Content-Disposition: form-data; name="Submit"',
            f'{newLine}Submit'.encode('utf-8')
        ]
    ]

    data = boundaryLine
    for c in payload:
        for cc in c:
            data += cc.decode('utf-8') + '\r\n'
        data += boundaryLine

    return requests.post(url_file, headers=headers, data=data)


if __name__ == '__main__':
    fileName = input('Filename (with extension): ')
    with open(fileName, 'r+') as f:
        fileContent = f.read()
    obfuscateLevel = int(input('Obfuscate level [0-3]: '))
    _docompile = input('Compile [true/false]: ').lower()
    if _docompile == 'true' or _docompile == 't' or _docompile == '1':
        docompile = '1'
    else:
        docompile = '0'
    _debug = input('Debug [true/false]: ').lower()
    if _debug == 'true' or _debug == 't' or _debug == '1':
        debug = '1'
    else:
        debug = '0'

    try:
        content = req().content
        if content == b'ERROR Could not compile file':
            print('Could not compile file!')
            exit(1)

        with open(fileName, 'wb+') as f:
            f.write(content)
        print('Done!')
    except Exception as e:
        print('An error occured:', e)