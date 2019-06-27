
<p align="center">
<img
    src="https://share.schollz.com/static/logo47.png"
    width="260" border="0" alt="share">
<br>
<a
href="https://github.com/schollz/share/releases/latest"><img
src="https://img.shields.io/badge/version-1.0.0-brightgreen.svg?style=flat-square"
alt="Version"></a> </p>

<p align="center">Easy simple file sharing from the browser and command-line. Try it at <a href="https://share.schollz.com">share.schollz.com</a>.</p>

`share` is an [open-source](https://github.com/schollz/share) server where you can easily share files through the browser or the terminal. `share` is inspired by [transfer.sh](https://transfer.sh/) and [send.firefox.com](https://send.firefox.com) which also store files temporarily after uploading via the browser or command-line. 

One main new feature in `share` specifically is that the files are stored for time *based on the file size*, so that smaller files will stay available longer (by default, the time to deletion is scaled so that 1 GB file will be deleted after 30 minutes). Another nice improvement is that each uploaded file gets a permalink based on the hash of file content, so you can easily share a unique content-addressable six-digit identifier instead of a long filename.

## Usage

Open the browser <a href="https://share.schollz.com">share.schollz.com</a> and upload a file.

Alternatively you can upload via the command-line:

**Upload a file**

```
$ curl -L --progress --upload-file README.md share.schollz.com
https://share.schollz.com/bemi4x/README.md
```

Use this `.bashrc`/`.zshrc` shortcut:

```bash
share() {
    curl --progress-bar --upload-file "$1" https://share.schollz.com | tee /dev/null;
    echo
}

alias share=share
```

**Download a file**

You can download the file with just the unique ID, or with the filename added. So each of these are identical:

```
$ curl -L share.schollz.com/bemi4x
$ curl -L share.schollz.com/bemi4x/README.md
```

or you can use `wget`:

```
$ wget --content-disposition share.schollz.com/bemi4x
```

## Install

You can easily install and run `share` on your own computer or server. First, make sure to [install Go](https://golang.org/dl/). Then clone the repo and generate the code and run.


```bash
$ git clone https://github.com/schollz/share.git
$ cd share/
$ go generate
$ go build -v
$ ./share
```

Use the flags (see `share --help`) for setting the max directory size, max file size, port, etc.

### Docker

You can also easily install and run with Docker (an 8MB image!). 

```
$ docker run -d -v `pwd`/data:/data -p 8222:8222 schollz/share
```

If you are running on a public server, be sure to include `-e url=https://YOURURL.com` when running with Docker so that it presents the right URL in HTTP responses.

## Acknowledgements

This is inspired by other great file transfer utilities and also utilizes [Dropzone.js](https://gitlab.com/meno/dropzone) and uses logos from [Logodust](http://logodust.com/).

## License

MIT
