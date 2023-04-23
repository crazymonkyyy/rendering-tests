tests for rendering

rn I would suggest mimiking rawwrite3.d and this command
`./rawwrite3| ffmpeg -f rawvideo -pixel_format rgb24 -video_size 1920x1080 -i pipe: -preset ultrafast out.mp4`

im still 1000x slow then piping data to /dev/null suggests but 1000000x faster then my first method of rendering a video
idk maybe thats good enough?