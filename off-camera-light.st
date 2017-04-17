"off-camera-light.st"
  "Estimates the setting for using a camera and speed light or conversely estimates the necessary scene parameters based on camera and speed light settings"

Namespace current: OffCameraLight [

    "The values and descriptions are from http://www.crakephoto.com/reference/index.html"
    <comment: 'A dictionary associating light values with scene descriptions'>
    LightValue := Dictionary new.
    LightValue at: 17 put: 'Rarely seen in nature'.
    LightValue at: 16 put: 'Bright sunlight off of sand or snow'.
    LightValue at: 15 put: 'Bright hazy sunlight'.
    LightValue at: 14 put: 'Weak hazy sunlight'.
    LightValue at: 13 put: 'Bright cloudy day'.
    LightValue at: 12 put: 'Overcast day'.
    LightValue at: 11 put: 'Shade on a bright day or during sunrise/set'.
    LightValue at: 10 put: 'Dusk or dawn'.
    LightValue at:  9 put: 'Late dusk or early dawn'.
    LightValue at:  8 put: 'Times square at night 	'.
    LightValue at:  7 put: 'Brightly lit street 	'.
    LightValue at:  6 put: 'Bright interior 	'.
    LightValue at:  5 put: 'Average interior or auditorium'.
    LightValue at:  4 put: 'Christmas or candle lights'.
    LightValue at:  3 put: 'Fireworks (emitted)'.
    LightValue at:  2 put: 'Lightning from a distance (emitted)'.
    LightValue at:  1 put: 'City skyline at night (emitted)'.
    LightValue at:  0 put: 'Dim ambient light'.
    LightValue at: -1 put: 'Really dim ambient light'.
    LightValue at: -2 put: 'Full moon off of sand or snow'.
    LightValue at: -3 put: 'Full moon'.
    LightValue at: -4 put: 'Half moon'.
    LightValue at: -5 put: 'Crescent moon'.
    LightValue at: -6 put: 'Starlight'.

    Object subclass: Camera [
    "The basis for variable names is Manual of Photography 10th edition.
       n  is relative aperture
       t  is shutter speed
       s  is sensitivity based" 
        | n t s |
        <comment: 'A class for describing the state of a camera.'>
    
        Camera class >> aperture: stop shutter: time iso: sensitivity [
            ^(self new)
            aperture: stop;
            shutter: time;
            iso: sensitivity;
            yourself.
        ]
    
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
        shutter: time [
            "Set camera's shutter speed."
            t := time.
        ]
        iso [
            "Get camera's sensitivity setting."
            ^s.
        ]
        iso: sensitivity [
            "Set camera's sensitivity setting."        
            s := sensitivity.
        ]
        eV [
            | sunny16Ev aperture shutter iso rawEv |
            "Calculate the Exposure Value."
            sunny16Ev := 8. 
            aperture := n squared log: 2.
            shutter := 100 / (1/t) log: 2.
            iso := (s / 100) log: 2.
            rawEv := aperture + shutter + iso.
            ^'Not yet implemented'.
        ]
        sunny16 [
            "Calculate the number of stops away from Sunny 16 settings."
            ^eV - 15.
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
        | subject lV foreground background |
        "A container for all the components of a photograph (sort of)."
    ]

 ]
