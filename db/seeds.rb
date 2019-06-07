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
User.destroy_all


project1 = Project.create title: 'test', tempo: 120

monosynth = InstrumentPreset.create(
  ins_type: "monosynth",
  options: {
    oscillator: {
      type: "amtriangle",
      harmonicity: 0.5,
      modulationType: "sine"
    },
    envelope: {
      attackCurve: "exponential",
      attack: 0.05,
      decay: 0.2,
      sustain: 0.2,
      release: 1.5,
    },
    filterEnvelope: {
      attack: 0.06 ,
      decay: 0.2 ,
      sustain: 0.5 ,
      release: 2 ,
      baseFrequency: 200 ,
      octaves: 7 ,
      exponent: 2
    },
    portamento: 0.05
    }
  )
polysynth = InstrumentPreset.create(
  ins_type: "polysynth",
  options: {
    oscillator: {
      type: "amtriangle",
      harmonicity: 0.5,
      modulationType: "sine"
    },
    envelope: {
      attackCurve: "exponential",
      attack: 0.05,
      decay: 0.2,
      sustain: 0.2,
      release: 1.5,
    },
    portamento: 0.05
  }
)

poly1 = Instrument.create(ins_type: polysynth.ins_type, options: polysynth.options, project: project1)
mono1 = Instrument.create(ins_type: monosynth.ins_type, options: monosynth.options, project: project1)

user1 = User.create(username: 'doug', project: project1)
