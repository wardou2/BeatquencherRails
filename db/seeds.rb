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
project2 = Project.create(title: 'test2', tempo: 120, users: [user])
project3 = Project.create(title: 'test3', tempo: 120, users: [user])

sceneA = Scene.create(name: "Verse", project: project1)
sceneB = Scene.create(name: "Chorus", project: project1)
sceneC = Scene.create(name: "Middle 8", project: project1)

monosynth = InstrumentPreset.create(
  "ins_type": "monosynth",
  "options": {
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
polysynth = InstrumentPreset.create(
  'ins_type': "polysynth",
  'options': {
    'oscillator': {
      'type': "amtriangle",
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
    'portamento': 0.05
  }
)

bassDrumP = InstrumentPreset.create(
  'ins_type': 'membranesynth',
  'options': {
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
  }
)

cymbalP = InstrumentPreset.create(
  'ins_type': "metalsynth",
  'options': {
    'volume': -4,
    'frequency': 800,
    'envelope': {
      'attack': 0.001,
      'decay': 1.4,
      'release': 0.2
    },
    'harmonicity': 5.1,
    'modulationIndex': 32,
    'resonance': 4000,
    'octaves': 1.5
  }
)

snareP = InstrumentPreset.create(
  'ins_type': "noisesynth",
  'options': {
    'volume': -4,
		'noise': {
			'type': 'pink',
			'playbackRate': 3,
			},
		'envelope': {
			'attack': 0.001,
			'decay': 0.13,
			'sustain': 0,
			'release': 0.03,
		}
  }
)
#
# poly1 = Instrument.create(ins_type: polysynth.ins_type, options: polysynth.options, project: project1)
# mono1 = Instrument.create(ins_type: monosynth.ins_type, options: monosynth.options, project: project1)
bassDrum = Instrument.create(ins_type: bassDrumP.ins_type, options: bassDrumP.options, project: project1)
cymbal = Instrument.create(ins_type: cymbalP.ins_type, options: cymbalP.options, project: project1)
snare = Instrument.create(ins_type: snareP.ins_type, options: snareP.options, project: project1)

# poly1scene1 = Track.create(instrument: poly1, scene: sceneA, notes:[0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0])
# mono1scene1 = Track.create(instrument: mono1, scene: sceneA, notes:[0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0])
# poly1scene2 = Track.create(instrument: poly1, scene: sceneB, notes:[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil])
# mono1scene2 = Track.create(instrument: mono1, scene: sceneB, notes:[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil])
bDscene2 = Track.create(instrument: bassDrum, scene: sceneB, notes:["C1", nil, nil, nil, nil, nil, nil, "C1", "C2", nil, "C1", nil, nil, nil, "C1", nil])
cymbalscene2 = Track.create(instrument: cymbal, scene: sceneB, notes:["C4", nil, "C4", nil, "C4", nil, "C4", nil, "C4", nil, "C4", nil, "C4", nil, "C4", nil])
snarescene2 = Track.create(instrument: snare, scene: sceneB, notes:[ nil, nil, nil, nil, "C2", nil, nil, nil, nil, nil, nil, nil, "C2", nil, nil, nil])
