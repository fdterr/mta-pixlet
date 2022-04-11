load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")
load("http.star", "http")


icons = {
'E_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAAC1JREFUGFdjZAAB82X/wTQyOBnFyAiT+H8iEi7FaLEczEaRhAnCVNFMJx7XAgCLLx5U0zAZsQAAAABJRU5ErkJggg=="""
),
'1_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADpJREFUGFdjZGBgYHhnovcfRCMDoTOXGBmRJQRPX2R4b6oPVwOXBEmAAFZJkAROnXglYcYiG82Iz7UAMnEik+bzeUgAAAAASUVORK5CYII="""
),
'C_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADFJREFUGFdjZAAB82X/wTQyOBnFyAiT+H8iEi7FaLEczEaRhAnCVFFJEm4c3E48rgUAki8eVLwWca8AAAAASUVORK5CYII="""
),
'A_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADNJREFUGFdjZAAB82X/wTQyOBnFyAiT+H8iEi7FaLEczEaRBAmCFGGVhGklXSemsXhcCwBL3CdUN92RHgAAAABJRU5ErkJggg=="""
),
'B_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADdJREFUGFdjZGBgYPifJPkfRCMDxnnPGRnhEnOfIeSSpcBsVEmQIEgRVkmQcqgEGTqRdDPicy0APTMiZcdeVY4AAAAASUVORK5CYII="""
),
'D_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADJJREFUGFdjZGBgYPifJPkfRCMDxnnPGRnhEnOfQeSSpeBqUCVBEiBFUAXUkkS3E59rAQQqJGVSUmuCAAAAAElFTkSuQmCC"""
),
'F_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADBJREFUGFdjZGBgYPifJPkfRCMDxnnPGRnhEnOfIeSSpcBsVEmoIEwVtXSiG4vPtQC88R5l/h398wAAAABJRU5ErkJggg=="""
),
'M_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADxJREFUGFdjZGBgYPifJPkfRCMDxnnPGRnhEnOfMTAkSzEwwGgGBgaIJLoElE+CJMxSFJ3oroHyGfG5FgCsSChl/1gaowAAAABJRU5ErkJggg=="""
),
'R_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADVJREFUGFdjZGBgYPhzhus/iEYGLCbfGBlhEiwm38Byf85wwdWgSIIkQIpgCqikE8NYfK4FADL7Lh2cyUdvAAAAAElFTkSuQmCC"""
),
'W_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADhJREFUGFdjZGBgYPhzhus/iEYGLCbfGBmxScAUgSVZTL6BdMM1wvgokjBB4iVB5qHrAokx4nMtAHoKNB3q50CRAAAAAElFTkSuQmCC"""
),
'6_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADdJREFUGFdjZACBydb/wTQyyD3KyIgs8T/nCFiacYoNhIZJgiRggjADUCThgrh0IptAQCce1wIALyshCTkkxb8AAAAASUVORK5CYII="""
),
'4_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADVJREFUGFdjZACBydb/wTQyyD3KyAiT+J9zhIFxig0DjAapI14SZirIBBSdMAmsxmKXxONaAJPRJAm50seNAAAAAElFTkSuQmCC"""
),
'5_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADlJREFUGFdjZACBydb/wTQyyD3KyAiT+J9zBC7FOMUGzEaRhAnCVBGnE6YaZDxWY8H2QO2D2InHtQBXYB4JvmDyEQAAAABJRU5ErkJggg=="""
),
'2_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAAEFJREFUGFdjZGBgYHhnovcfRCMDoTOXGBlhEoKnL4Ll3pvqw9XAJWEiIEUwBSiSyBIgxSjGIhuJIQkzGm4sPtcCADJxIpMWjg88AAAAAElFTkSuQmCC"""
),
'3_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADlJREFUGFdjZGBgYHhnovcfRCMDoTOXGBlhEoKnL4Ll3pvqw9XAJWEiIEUwBRg6kXWTphPFTnyuBQAhJSKTTCAy3wAAAABJRU5ErkJggg=="""
),
}

grey_icons = {
'E_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADBJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokjBBmCpa6cTnWgBTUiT6cQ/IFgAAAABJRU5ErkJggg=="""
),
'1_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADhJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRmRJdLT00EK4WrgkiAJqCmYkiARnDrxSsKMRTaaEZ9rAUTWJPopC5+HAAAAAElFTkSuQmCC"""
),
'C_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADRJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokjBBmCoqScKMg9uJz7UAYaok+g18HdgAAAAASUVORK5CYII="""
),
'A_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADZJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokiBBkCKskjCtpOvEMBafawEQUy36pOGQeAAAAABJRU5ErkJggg=="""
),
'B_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADpJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokiBBkCKsklAr4CaQphNZNyM+1wIAmEQq+pFMgnUAAAAASUVORK5CYII="""
),
'D_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADVJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6WC5mTNnwtWgSIIkQIpgCqgkiWEnPtcCAMyrLfr20KWfAAAAAElFTkSuQmCC"""
),
'F_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADJJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokjBBmCoq6cQwFp9rAWGqJPoADKwWAAAAAElFTkSuQmCC"""
),
'M_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADlJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6SBFDDAapBAsiS4B4xMvCbMTRSe6Y2B8RnyuBQDL5zP6W21vAAAAAABJRU5ErkJggg=="""
),
'R_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADVJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6WC5mTNnwtWgSIIkQIpgCqikE8NYfK4FAB6rLfqsCKSFAAAAAElFTkSuQmCC"""
),
'W_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADhJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRmxScAUgSXT09NBuuEaYXwUSZgg8ZIg89B1gcQY8bkWAGW6M/oMcDczAAAAAElFTkSuQmCC"""
),
'6_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADlJREFUGFd9jsEJADAMAs20zuS0LQkY0kfjR/BQDACQdNKnSEZMQLK4pPKGCRx64YEOv825sDe3txcWYSf6UzkyVwAAAABJRU5ErkJggg=="""
),
'4_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADZJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6SBFDDAapJB4SZixIBNQdMIksBqLVRKfawGC1yr6lXK8bgAAAABJRU5ErkJggg=="""
),
'5_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADxJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6XC5mTNngtkokjBBmCridMJUg4zHaizUcXC7GfG5FgBCfiT6RpTuvgAAAABJRU5ErkJggg=="""
),
'2_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAAD1JREFUGFd9jkEKADAIw+pr+6a+dkOhogzmRTAhGAAg6eSeQzLCgGQxSe009CUlCwtOkPLKzuQDne7s79sLRNYk+n5mhMUAAAAASUVORK5CYII="""
),
'3_ICON' : base64.decode(
  """iVBORw0KGgoAAAANSUhEUgAAAAcAAAAHCAYAAADEUlfTAAAAAXNSR0IArs4c6QAAADlJREFUGFdjZGBgYJg5c+Z/EI0M0tPTGRlhEunp6WC5mTNnwtXAJWEiIEUwBRg6kXWTphPFTnyuBQAxqiT6umn9FQAAAABJRU5ErkJggg=="""
),
}

SECOND_FRAME=render.Column(main_align="start", children=[
                    render.Row(
                      children=[
                        render.Image(src=icons['E_ICON'],height=7,width=7),
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
                        render.Image(src=icons['E_ICON'],height=7,width=7),
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
                        render.Image(src=icons['1_ICON'],height=7,width=7),
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
                        render.Image(src=icons['1_ICON'],height=7,width=7),
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

def generate_column(childs):
  return render.Column(main_align="start",expanded=True, children=childs)

def generate_row(line,time,direction):
  # print(line,int(time))
  if time == '-':
    timeStr = '∞'
    textColor = '#FFA500'
    icon = icons[line+'_ICON']
  elif time == 'none':
    timeStr = 'NR'
    textColor = '#ff0000'
    icon = grey_icons[line+'_ICON']
  else:
    timeStr = str(int(time)) + "m"
    textColor = '#FFA500'
    icon = icons[line+'_ICON']
  
  if direction == 'uptown':
    dirStr = '↑'
  elif direction == 'downtown':
    dirStr = '↓'

  return render.Row(cross_align="start",
                      children=[
                        render.Text(content=dirStr),
                        render.Image(src=icon,height=7,width=7),
                        render.Box(height=8, width=1),
                        render.Box(height=8, width=18, 
                        child=render.Marquee(
                          width=18,
                          height=8,
                          child=render.Text(content=timeStr, 
                          height=7, 
                          color=textColor
                          )
                        )),
                      ]
                    )

def main(config):
  data = http.get('http://140.82.45.186:3000/',params={},headers={},auth=())
  uptown_stations = data.json()['uptown']
  downtown_stations = data.json()['downtown']

  subwayList = [
    [
      'C',
      'E',
      '1',
      'F',
    ],
    [
      'M',
      'R',
      'W',
      'A',
    ],
    [
      '2',
      '3',
      '4',
      '5'
    ]
      # '4',
    # '6',
    # '2',
    # 'N',
    # 'Q',
  ]

  uptownList = []
  downtownList = []

  print(uptown_stations['1'])

  for i in range(len(subwayList)):
    uptownChildren = []
    downtownChildren = []
    for line in subwayList[i]:
      uptownChildren.append(generate_row(line,uptown_stations[line][0]['time'],'uptown'))
      downtownChildren.append(generate_row(line,downtown_stations[line][0]['time'],'downtown'))

    uptownList.append(generate_column(uptownChildren))
    downtownList.append(generate_column(downtownChildren))

  print('uptownList', uptownList)

  second_frame_list = [SECOND_FRAME, SECOND_FRAME]
  print('secondFrame', second_frame_list)
  return render.Root(delay=5000,
        child=render.Row(
            children=[
              render.Animation(children=
                uptownList
                ),
                render.Animation(children=
                downtownList
                ),
            ],
            main_align="center",
            expanded=True
        )
    )
