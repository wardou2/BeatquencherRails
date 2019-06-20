# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.destroy_all
Instrument.destroy_all
Scene.destroy_all
Track.destroy_all

user = User.first

project1 = Project.create(title: 'test', tempo: 120, users: [user])

sceneA = Scene.create(name: "Verse", project: project1)
sceneB = Scene.create(name: "Chorus", project: project1)
sceneC = Scene.create(name: "Middle 8", project: project1)

monoP = InstrumentPreset.create(
  "ins_type": "monosynth",
  "name": "Monosynth",
  'melodic': true,
  "options": {
    'volume': -3,
    'mute': false,
    "oscillator": {
      'type': "sawtooth",
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
      'type': "amtriangle",
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
        'distortion': 0.17
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
      'attack': 0.001,
      'decay': 0.180,
      'release': 0.155,
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
      'attack': 0.001,
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
bassDrum = Instrument.create(ins_type: bassDrumP.ins_type, name: bassDrumP.name, melodic: bassDrumP.melodic, options: bassDrumP.options, effects: bassDrumP.effects, project: project1)
closedHihat = Instrument.create(ins_type: closedHihatP.ins_type, name: closedHihatP.name, melodic: closedHihatP.melodic, options: closedHihatP.options, effects: closedHihatP.effects, project: project1)
openHihat = Instrument.create(ins_type: openHihatP.ins_type, name: openHihatP.name, melodic: openHihatP.melodic, options: openHihatP.options, effects: openHihatP.effects, project: project1)
snare = Instrument.create(ins_type: snareP.ins_type, name: snareP.name, melodic: snareP.melodic, options: snareP.options, effects: snareP.effects, project: project1)
mono = Instrument.create(ins_type: monoP.ins_type, name: monoP.name, melodic: monoP.melodic, options: monoP.options, effects: monoP.effects, project: project1)
poly = Instrument.create(ins_type: polyP.ins_type, name: polyP.name, melodic: polyP.melodic, options: polyP.options, effects: polyP.effects, project: project1)

# poly1scene1 = Track.create(instrument: poly1, scene: sceneA, notes:[0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0])
# mono1scene1 = Track.create(instrument: mono1, scene: sceneA, notes:[0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0])
# poly1scene2 = Track.create(instrument: poly1, scene: sceneB, notes:['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''])
# mono1scene2 = Track.create(instrument: mono1, scene: sceneB, notes:['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''])
bDscene2 = Track.create(instrument: bassDrum, scene: sceneB, notes:["C1", '', '', '', '', '', '', "C1", "C1", '', "C1", '', '', '', "C1", ''])
closedHihatscene2 = Track.create(instrument: closedHihat, scene: sceneB, notes:["C4", '', "C4", '', "C4", '', "C4", '', "C4", '', "C4", '', "C4", '', "C4", ''])
openHihatscene2 = Track.create(instrument: openHihat, scene: sceneB, notes:['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''])
snarescene2 = Track.create(instrument: snare, scene: sceneB, notes:[ '', '', '', '', "C2", '', '', '', '', '', '', '', "C2", '', '', ''])
monoscene2 = Track.create(instrument: mono, scene: sceneB)
polyscene2 = Track.create(instrument: poly, scene: sceneB)
