#!/usr/bin.python

#  MIT License
#
#  Copyright (c) 2024 Bolt Contributors
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

from pathlib import Path
import re
import subprocess
import sys

logFile = None


def log(str):
    if logFile:
        logFile.write(f"{str}\n")
    else:
        print(str)


def main():
    global logFile

    path = Path().resolve()
    if len(sys.argv) >= 2:
        path = Path(sys.argv[1])
    if len(sys.argv) >= 3:
        logFile = open(sys.argv[2], "w")

    log(f"working directory at: {path}")

    files = list(path.glob("**/*.strings"))

    log(f"found {len(files)} files\n")

    log(f"linting with plutil...\n")

    for stringFile in files:
        res = subprocess.run(["plutil", "-lint", stringFile])
        if res.returncode != 0:
            log(f"lint: {stringFile}: Invalid\n")
            exit(1)

        log(f"{stringFile}: OK\n")

    log(f"finding duplicate keys...\n")

    for stringFile in files:
        with open(stringFile) as f:
            key_set = set()
            lines = f.read().splitlines()
            for line in lines:
                r = re.compile(r'"(.*?)" = ".*?";')
                result = r.findall(line)
                if len(result) > 0:
                    key = result[0]
                    if key in key_set:
                        log(f"duplicate key: {key} in file: {stringFile}")
                        exit(1)
                    key_set.add(key)

        log(f"duplicate check: {stringFile}: OK\n")

    if logFile:
        logFile.close()


if __name__ == "__main__":
    main()
