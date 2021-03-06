MidiOut mout;
MidiMsg msg;

0 => int port;

if ( !mout.open(port))
{
    <<<"Error MIDI port did not open ", port>>>;
}

fun void send(int note, int velocity)
{
    144 => msg.data1;
    note => msg.data2;
    velocity => msg.data3;
    mout.send(msg);
}

while ( true )
{
    Math.random2(0,12) => int arm;
    Math.random2(0,127) => int volume;
    send(arm, volume);
    .5::second => now;
}