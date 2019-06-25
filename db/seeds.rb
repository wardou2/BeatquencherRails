
# Project.destroy_all
# Instrument.destroy_all
# Scene.destroy_all
# Track.destroy_all
#
# user = User.first
#
# project1 = Project.create(title: 'test', tempo: 94, users: [user])
#
# sceneA = Scene.create(name: "Scene 1", project: project1)
# sceneB = Scene.create(name: "Scene 2", project: project1)
# sceneC = Scene.create(name: "Scene 3", project: project1)
InstrumentPreset.destroy_all

monoP = InstrumentPreset.create(
  "ins_type": "monosynth",
  "name": "Monosynth",
  'melodic': true,
  "options": {
    'volume': -3,
    'mute': false,
    "oscillator": {
      'type': "fmsine",
      'harmonicity': 0.5,
      'modulationType': "sine"
    },
    'envelope': {
      'attackCurve': "exponential",
      'attack': 0.05,
      'decay': 0.2,
      'sustain': 0.2,
      'release': 1.5,
    },
    'filterEnvelope': {
      'attack': 0.06 ,
      'decay': 0.2 ,
      'sustain': 0.5 ,
      'release': 2 ,
      'baseFrequency': 200 ,
      'octaves': 7 ,
      'exponent': 2
    },
    'portamento': 0.05
    }
  )
polyP = InstrumentPreset.create(
  'ins_type': "polysynth",
  'name': "Polysynth",
  'melodic': true,
  'options': {
    'volume': -3,
    'mute': false,
    'polyphony': 4,
    'oscillator': {
      'type': "fmsine",
      'harmonicity': 0.5,
      'modulationType': "sine"
    },
    'filter': {
      'Q': 6
    },
    'envelope': {
      'attackCurve': "exponential",
      'attack': 0.05,
      'decay': 0.2,
      'sustain': 0.2,
      'release': 1.5,
    },
    'filterEnvelope': {
      'attack': 0.06 ,
      'decay': 0.2 ,
      'sustain': 0.5 ,
      'release': 2 ,
      'baseFrequency': 200 ,
      'octaves': 7 ,
      'exponent': 2
    },
    'portamento': 0.05
  }
)

bassDrumP = InstrumentPreset.create(
  'ins_type': 'bass_drum',
  'name': 'Bass Drum',
  'melodic': false,
  'options': {
    'volume': 0,
    'mute': false,
    'pitchDecay': 0.05,
    'octaves': 4,
    'oscillator': {
      'type': "fmsine",
      'phase': 140,
      'modulationType': "sine",
      'modulationIndex':0.8,
      'partials': [1]
    },
    'envelope':{
      'attack':0.01,
      'decay':0.74,
      'sustain': 0.71,
      'release': 0.05,
      'attackCurve':"exponential"
    }
  },
  'effects': [
    {
      'eff_type': 'filter',
      'eff_options': {
        'Q': 1,
        'frequency': 18000
      }
    },
    {
      'eff_type': 'distortion',
      'eff_options': {
        'distortion': 0.1
      }
    }
  ]
)

closedHihatP = InstrumentPreset.create(
  'ins_type': "closed_hihat",
  'name': 'Hi-Hat (closed)',
  'melodic': false,
  'options': {
    'volume': -22,
    'mute': false,
    'frequency': 800,
    'envelope': {
      'attack': 0.01,
      'decay': 0.18,
      'release': 0.15,
      'sustain': 0.01
    },
    'harmonicity': 5.1,
    'modulationIndex': 32,
    'resonance': 4000,
    'octaves': 1.5
  }
)
openHihatP = InstrumentPreset.create(
  'ins_type': "open_hihat",
  'name': 'Hi-Hat (open)',
  'melodic': false,
  'options': {
    'volume': -22,
    'mute': false,
    'frequency': 800,
    'envelope': {
      'attack': 0.01,
      'decay': 1.4,
      'release': 0.2,
      'sustain': 0.01
    },
    'harmonicity': 5.1,
    'modulationIndex': 32,
    'resonance': 4000,
    'octaves': 1.5
  }
)

snareP = InstrumentPreset.create(
  'ins_type': "snare",
  'name': 'Snare',
  'melodic': false,
  'options': {
    'volume': -3,
    'mute': false,
		'noise': {
			'type': 'white',
			'playbackRate': 3,
			},
		'envelope': {
			'attack': 0.001,
			'decay': 0.13,
			'sustain': 0.001,
			'release': 0.03,
		}
  },
  'effects': [
    {
      'eff_type': 'filter',
      'eff_options': {
        'type': 'lowpass',
        'Q': 1,
        'frequency': 18000
      }
    },
    {
      'eff_type': 'reverb',
      'eff_options': {
        'wet': 0.16
      }
    }
  ]
)

#
# poly1 = Instrument.create(ins_type: polysynth.ins_type, options: polysynth.options, project: project1)
# mono1 = Instrument.create(ins_type: monosynth.ins_type, options: monosynth.options, project: project1)
# bassDrum = Instrument.create(ins_type: bassDrumP.ins_type, name: bassDrumP.name, melodic: bassDrumP.melodic, options: bassDrumP.options, effects: bassDrumP.effects, project: project1)
# closedHihat = Instrument.create(ins_type: closedHihatP.ins_type, name: closedHihatP.name, melodic: closedHihatP.melodic, options: closedHihatP.options, effects: closedHihatP.effects, project: project1)
# openHihat = Instrument.create(ins_type: openHihatP.ins_type, name: openHihatP.name, melodic: openHihatP.melodic, options: openHihatP.options, effects: openHihatP.effects, project: project1)
# snare = Instrument.create(ins_type: snareP.ins_type, name: snareP.name, melodic: snareP.melodic, options: snareP.options, effects: snareP.effects, project: project1)
# mono = Instrument.create(ins_type: monoP.ins_type, name: monoP.name, melodic: monoP.melodic, options: monoP.options, effects: monoP.effects, project: project1)
# poly = Instrument.create(ins_type: polyP.ins_type, name: polyP.name, melodic: polyP.melodic, options: polyP.options, effects: polyP.effects, project: project1)
#
# bDscene1 = Track.create(instrument: bassDrum, scene: sceneA, notes:["F1","","","F1","","","","","","F1","F1","","","F1","",""])
# closedHihatscene1 = Track.create(instrument: closedHihat, scene: sceneA, notes: ["C4","","C4","","C4","","","","C4","","C4","","C4","","C4",""])
# openHihatscene1 = Track.create(instrument: openHihat, scene: sceneA, notes: ["","","","","","","F1","","","","","","","","",""])
# snarescene1 = Track.create(instrument: snare, scene: sceneA, notes: ["","","","","F1","","","","","","","","F1","","",""])
# monoscene1 = Track.create(instrument: mono, scene: sceneA, notes: ["G2","","","G2","A2","","","","","F2","","","F#2","C#3","",""])
# polyscene1 = Track.create(instrument: poly, scene: sceneA, notes: ["D3-G2-B2-F#3","","","","","","","","","","F#2-A2-E3-C#3","","","F#2-A2-D3-E3","",""])
#
# bDscene2 = Track.create(instrument: bassDrum, scene: sceneB)
# closedHihatscene2 = Track.create(instrument: closedHihat, scene: sceneB)
# openHihatscene2 = Track.create(instrument: openHihat, scene: sceneB)
# snarescene2 = Track.create(instrument: snare, scene: sceneB)
# monoscene2 = Track.create(instrument: mono, scene: sceneB)
# polyscene2 = Track.create(instrument: poly, scene: sceneB)
#
# bDscene3 = Track.create(instrument: bassDrum, scene: sceneC)
# closedHihatscene3 = Track.create(instrument: closedHihat, scene: sceneC)
# openHihatscene3 = Track.create(instrument: openHihat, scene: sceneC)
# snarescene3 = Track.create(instrument: snare, scene: sceneC)
# monoscene3 = Track.create(instrument: mono, scene: sceneC)
# polyscene3 = Track.create(instrument: poly, scene: sceneC)
