load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

BTC_ICON = base64.decode(
    """
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAlklEQVQ4T2NkwAH+H2T/jy7FaP+
TEZtyDEG4Zi0TTPXXzoDF0A1DMQRsADbN6MZdO4NiENwQbAbERh1lWLzMmgFGo5iFZBDYEFwuwG
sISCPUIKyGgDRjAyBXYXMNIz5XgDQga8TpLboYgux8DO/AwoUuLiEqTLBFMcmxQ7V0gssgklIsL
AYozjsoBoE45OZi5DRBSnkCAMLhlPBiQGHlAAAAAElFTkSuQmCC
"""
)

E_ICON = base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAAC1JREFUGFdjZAAB82X/wTQyOBnFyAiT+H8iEi7FaLEczEaRhAnCVNFMJx7XAgCLLx5U0zAZsQAAAABJRU5ErkJggg=="""
)

ONE_ICON = base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADpJREFUGFdjZGBgYHhnovcfRCMDoTOXGBmRJQRPX2R4b6oPVwOXBEmAAFZJkAROnXglYcYiG82Iz7UAMnEik+bzeUgAAAAASUVORK5CYII="""
)

SECOND_FRAME=render.Column(main_align="space_evenly", children=[
                    render.Row(
                      children=[
                        render.Image(src=E_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=E_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=ONE_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=ONE_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                ])

def main(config):
    timezone = config.get("timezone") or "America/New_York"
    now = time.now().in_location(timezone)

    return render.Root(delay=3000,
        child=render.Row(
            children=[
              render.Animation(children=[
                render.Column(main_align="space_evenly", children=[
                    render.Row(
                      children=[
                        render.Image(src=E_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=E_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=E_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Image(src=ONE_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                ]),SECOND_FRAME]),
                render.Column(main_align="space_evenly", children=[
                    render.Row(
                      children=[
                        render.Image(src=ONE_ICON,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=24, 
                        # color='#FFFFFF', 
                        child=render.Marquee(
                          width=24,
                          height=8,
                          child=render.Text(content="5 min", 
                          height=7, 
                          color='#FFA500'
                          )
                        )),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Box(height=8, width=8, color='#0000FF'),
                        render.Marquee(
                          width=24,
                          height=8,
                          # color='#FF0000',
                          child=render.Text(content="Hello There", height=8)
                        ),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Box(height=8, width=8, color='#FF0000'),
                        render.Marquee(
                          width=24,
                          height=8,
                          # color='#FF0000',
                          child=render.Text(content="Hello There", height=8)
                        ),
                      ]
                    ),
                    render.Row(
                      children=[
                        render.Box(height=8, width=8, color='#0000FF'),
                        render.Marquee(
                          width=24,
                          height=8,
                          # color='#FF0000',
                          child=render.Text(content="Hello There", height=8)
                        ),
                      ]
                    ),
                ]),
            ],
            cross_align="end",
            expanded=True
        )
    )
