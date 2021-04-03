# Pulse config for streaming
pactl load-module module-null-sink sink_name=Combined_Output sink_properties=device.description=Combined_Output
pactl load-module module-null-sink sink_name=Recorded_Sink sink_properties=device.description=Recorded_Sink
pactl load-module module-loopback source=alsa_input.pci-0000_00_1f.3.analog-stereo sink=Combined_Output
pactl load-module module-loopback source=3 sink=Combined_Output
pactl load-module module-loopback source=3 sink=alsa_output.pci-0000_00_1f.3.analog-stereo
