#### Disabling Intel Turbo Boost on boot
- Add `intel_pstate=disable` to GRUB DEFAULT in `/etc/default/grub`, then regen grub config with `grub-mkconfig -o /boot/grub/grub.cfg

#### Enabling stream audio on Discord
- With PAVUControl and PulseAudio installed, run goliveaudio.sh before starting stream and check sinks. Set game to play on Recorded sink and WebRTC engine to record on Combined Sink

#### To get fan control an Acer Nitro 7
- Install NBFC from the AUR and use `Acer Predator G3-572` config



We no longer use the power.sh hack to change governer based on battery state since forcing the system to use acpi_cpufreq instead of intel_pstate allows us to make use of the schedutil governer
