#### Disabling Intel Turbo Boost on boot
- Move noturbo.desktop to `~/.configs/autostart` (needs cpupower-gui installed with custom profile created)

#### Enabling stream audio on Discord
- With PAVUControl and PulseAudio installed, run goliveaudio.sh before starting stream and check sinks. Set game to play on Recorded sink and WebRTC engine to record on Combined Sink

#### To get fan control an Acer Nitro 7
- Install NBFC from the AUR and use `Acer Predator G3-572` config

#### To dynamically change governor based on battery state
- Add line to `/etc/sudoers` = `<username> ALL=(root) NOPASSWD: /path/to/power.sh`

- Create udev rule `/etc/udev/rules.d/powersave.rules` = 
```
SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="/path/to/power.sh AC"
SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/path/to/power.sh BAT"
```

- Create `/etc/systemd/system/root-resume.service` = 
```
[Unit]
Description=Local system resume actions
After=suspend.target

[Service]
Type=simple
ExecStart=/path/to/power.sh

[Install]
WantedBy=suspend.target
```

- Create `/etc/systemd/system/power_management.service` =
```
[Unit]
Description=Sets the CPU governor on boot according to AC mode
Requires=multi-user.target
After=multi-user.target

[Service]
Type=oneshot
RemainAfterExit=no
ExecStart=/path/to/power.sh

[Install]
WantedBy=multi-user.target
```
