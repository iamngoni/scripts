import os

formats = {
    "video": {
        "folder_name": "Video",
        "types": ["mp4", "mkv"]
    },
    "audio": {
        "folder_name": "Music",
        "types": ["mp3"]
    },
    "images": {
        "folder_name": "Pictures",
        "types": ["png", "jpg", "jpeg", "webp", "gif"]
    },
    "docs": {
        "folder_name": "Documents",
        "types": ["pdf", "doc", "docx"]
    },
    "compressed": {
        "folder_name": "Compressed",
        "types": ["zip", "tar", "gz", "iso"]
    },
    "miscellaneous": {
        "folder_name": "Miscellaneous",
        "types": ["json", "torrent"]
    },
    "programs": {
        "folder_name": "Programs",
        "types": ["apk", "deb", "appimage", "snap"]
    }
}

downloads_path = "/home/iamngoni/Downloads"


def ext(file_name: str):
    return file_name.split(".")[-1]


files_list = os.listdir(downloads_path)

for file in files_list:
    for key, value in formats.items():
        file_extension = ext(file)
        if file_extension in value.get("types"):
            print(f"Moving {file} to {value.get('folder_name')}.")
            if not os.path.exists(f"{downloads_path}/{value.get('folder_name')}"):
                print(f"Creating directory: {downloads_path}/{value.get('folder_name')}")
                os.mkdir(f"{downloads_path}/{value.get('folder_name')}")
            os.system(f"mv '{downloads_path}/{file}' '{downloads_path}/{value.get('folder_name')}/{file}'")
