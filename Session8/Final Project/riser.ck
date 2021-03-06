//set up instrument
SawOsc saw => LPF lpf => NRev r => Gain g => dac;
.1 => g.gain;
.2 => r.mix;
62 => Std.mtof => saw.freq;

BPM tempo;
32 => float freincrement;
for (0 => int i; i < (64); i++)
{
    saw.freq() + (freincrement /4) => saw.freq;
    lpf.freq() +  freincrement => lpf.freq;
    tempo.quarterNote / 4 => now;
}
for (0 => int i; i < (32); i++)
{
    saw.freq() + (freincrement /4) => saw.freq;
    lpf.freq() -  freincrement => lpf.freq;
    g.gain() - .003 => g.gain;
    tempo.quarterNote / 16 => now;
}


