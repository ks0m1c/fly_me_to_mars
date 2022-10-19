<p align="center">
<img src="https://raw.githubusercontent.com/KosmonautX/fly_me_to_mars/master/martian.png">
</p>

# Martian Flyby

Boot Urbit Comets &amp; Planets into orbit on Fly.io utilising the expansionary powers of SWAP SPACE to map 2048MB needed for the bootsequence

## How to Launch Martian to your Earth region

You will need the [flyctl]("https://fly.io/docs/flyctl/installing/") CLI utility.

### For Earthlings who want to take comets for a spin
Just Fly launch, its that ez

``` bash
flyctl launch
```
### For Martians with non-booted planets 
Place your planet keys at the root directory & set your planet's name as `$PLANET` env variable

You can set variables either in the .toml file or through the fly secrets

``` bash
flyctl secrets set PLANET=sampel-palnet
flyctl launch
```

### For Martians with planets

Place your planet folder at root directory & set your planet's name as `$PLANET` env variable

You can set variables either in the .toml file or through the fly secrets

``` bash
flyctl secrets set PLANET=sampel-palnet
flyctl deploy
```
