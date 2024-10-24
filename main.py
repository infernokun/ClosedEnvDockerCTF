import requests
import json
import os

url = "http://localhost:8000/api/v1/"

api_key = os.getenv("CTFD_API_KEY")

headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": f"Token {api_key}",
}


def load_challenges_from_file(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        return json.load(file)


def create_challenges_and_flags(challenges_with_flags):
    for item in challenges_with_flags:
        challenge_data = item["challenge"]
        challenge_response = requests.post(
            url + "challenges", headers=headers, json=challenge_data
        )
        challenge_id = challenge_response.json()["data"]["id"]
        for flag in item["flags"]:
            flag_data = {
                "challenge_id": challenge_id,
                "type": "static",
                "content": flag["content"],
            }
            requests.post(url + "flags", headers=headers, json=flag_data)
        for hint in item["hints"]:
            hint_data = {
                "challenge_id": challenge_id,
                "content": hint["content"],
                "cost": hint["cost"],
            }
            requests.post(url + "hints", headers=headers, json=hint_data)
        """for files in item["files"]:
            file_data = {"challenge_id": challenge_id, "file": files["file"]}
            requests.post(url + "files", headers=headers, files=file_data)"""


def main():

    if api_key is None:
        print("CTFD_API_KEY environment variable is not set")
        return

    script_dir = os.path.dirname(os.path.abspath(__file__))

    docker_challenges_path = [
        os.path.join(script_dir, "challenges", "docker-commands.json"),
        os.path.join(script_dir, "challenges", "docker-containers.json"),
        os.path.join(script_dir, "challenges", "docker-compose.json"),
        os.path.join(script_dir, "challenges", "docker-terminology.json"),
        os.path.join(script_dir, "challenges", "docker-file.json"),
        os.path.join(script_dir, "challenges", "docker-ctf.json"),
    ]

    for paths in docker_challenges_path:
        challenges_with_flags = load_challenges_from_file(paths)
        create_challenges_and_flags(challenges_with_flags)


if __name__ == "__main__":
    main()
