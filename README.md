# OpenKeeper
 　　OpenKeeper is a software for Linux to replace the NetKeeper. I don't know who is the original author. I put it on GITHUB is just because I found a bug when I use it, I have fixed it and warry others occur this bug again. 
## Installation
>apt-get install build-essential<br>
>git clone https://github.com/purpleroc/OpenKeeper<br>
>cd openkeeper/<br> 
>cd openkeeper-cli-1.2/<br> 
>cd 32/　　　or 　　　cd 64/<br>
>sudo ./install.sh

## Usage
* 1.　Config<br> 

>sudo ok-config<br>

intput username/password/device for dial.

* 2. Dial<br>

You can use:
>sudo ok

to dial, or you can use:
>sudo okok

when you disconnect, it will auto re-dial. 

* 3. Stop

You can use:
>sudo ok-stop

or
>sudo okok-stop

