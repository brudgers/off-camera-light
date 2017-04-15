"off-camera-light.st"
"Estimates the setting for using a camera and speed light or conversely estimates the necssary scene parameters based on camera and speed light settings"

Object subclass: Camera [
"The basis for variable names is Manual of Photography 10th edition.
   n  is relative aperture
   t  is shutter speed
   s  is sensitivity based" 
    | n t s |
    <comment: 'A class for describing the state of a camera.'>
    aperture [
        "Get the aperture value."
        ^n.
    ]
    aperture: stop [
        "Set the camera's aperture."
        n := stop.
    ]
    shutter [
        "Get camera's shutter speed."
        ^t.
    ]
    shutter: aNumber [
        "Set camera's shutter speed."
        t := aNumber.
    ]
    iso [
        "Get camera's sensitivity setting."
        ^s.
    ]
    iso: aNumber [
        "Set camera's sensitivity setting."        
        s := aNumber.
    ]
    eV [
        "Calculate the number of stops away from Sunny 16."
        ^'Not yet implemented'.
    ]
]

Object subclass: Light [
    "A class to model a speedlight state."
    | rating power_setting |
    guide_number [
        "Get the rating of a speedlight."
        ^rating.
    ]
    guide_number: aDistance [
        "Set the rating of a speedlight."
        rating := aDistance.
    ]
    power [
        "Get the power setting of the speedlight."
        ^power_setting.
    ]
    power: aNumber [
        "Get the power setting of the speedlight."
        power_setting := aNumber.
    ]
]        

Object subclass: Subject [
    | d |
    "A class to describe a photographic subject."
    distance [
        "Get the distance to a subject."
        ^d.
    ]

    distance: aNumber [
        "Set the distance to a subject."
        d := aNumber.
    ]
]    

Object subclass: Scene [
    | camera light subject eV |
    "A container for all the components of a photograph (sort of)."
]
