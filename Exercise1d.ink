// you can kinda tell i want to turn this one into my final project! i really like this idea and i've written way too much NOT to use it. but it is getting late and i am getting tired so for now, our first-person character will suffer the same fate as me in 20-30 minutes.

VAR time = -1
VAR mood = 0
// measures friend's mood. 0 is the baseline - happy to be seeing the stars, comfortable, a little wistful. positive = positive emotion, negative = negative emotion
VAR bracelet_time = 999
VAR bracelet_colors_nice = 0
~ bracelet_colors_nice = RANDOM(0,1)
// not sure it's gonna make it into this exercise, but eventually i want the bracelet to be something that you can see your friend working on while you look at the stars, and then after 2 pieces of dialogue you'll be able to take it and get something later on. 

-> beginning

== beginning ==
You're sitting on the roof. They are too, gazing up at the stars with the rapt wonder they never truly seemed to lose. The two of you have seen these stars a hundred times, and you've seen the same sparks in their eyes, joy in the corners of their mouth, gears turning in their brain a hundred times, too.

...A hundred and one, you correct yourself. It was your idea to end on 101 before they left. It felt like a nice number. But there's so much you need to say, and all before the sun comes up. Before they go off to school and leave you in this middle-of-nowhere town.

* [Look at the stars.]
-> stars

== stars ==
{time >6: -> sleep}
You take your eyes off of your friend and look back up at the stars.
{advance_time(1)} {decay_mood()}
{time<=2:The sky is still dark and the stars holes poked in paper, letting light through from behind.}
{time==3 or time==4: You think you see a shooting star in the sky! ...It's an airplane.}
{time==5 or time==6: A few hours have passed since you first got here. The moon is so incredibly bright in the sky.}
<>{mood<0:{~ You feel their eyes on you, careful, cautious. You pretend you don't.| The silence feels different now.| You hear a sigh.}}
{mood>0:{~ You can feel the vibrations of their knee bouncing fast. It's a happy fidget, you think.| You hear them hum some tune you don't recognize. | You can practically feel their smile from here.}} 
{time <=4:{not constellation.cassiopeia && not constellation.aquila:<> You think you see that constellation they always look for, but you forget the name.|<> You notice {constellation.cassiopeia:Cassiopeia}{constellation.aquila:Aquila} in the sky and smile.}}
{bracelet_time != 999 and bracelet_time >0:{mood<0:<> Your friend is... still working on your bracelet, using it to occupy their hands.|<> Your friend is happily working on your bracelet. {bracelet_time == 1:It's coming along well!}}}

There's so much you want to say...
* {time >=4}"What's the name of that constellation you're always looking for?"
-> constellation
* "Are you gonna forget me when you leave?"
-> forget
* "What's the first thing you're gonna do when you get out there?"
-> first_thing
// * "Are your parents gonna be okay without you here?"
// * "Are you all ready to go tomorrow?"
- -> DONE

== function advance_time(t) ==
~ time += t

== function change_mood(m) ==
{ mood < m:
    ~ mood = m
- else:
    ~ mood += m
}
~ return mood

== function decay_mood() ==
{ mood < 0:
~ mood += 0.5
}

{ mood < -1:
~ mood += 0.5
}

== constellation ==
They look over at you, try to see what you're seeing? "Oh, which one?"
* "Y'know, the one that..."
** "looks like a W?"
-> cassiopeia
** "looks kinda like a bird?"
-> aquila
= cassiopeia
"You mean Cassiopeia? I don't always look for it, though. I mostly just try and point it out to you."
* "Why?"
    "Because it's an easy shape to figure out. Like you said, it's a W, right? I know you don't know much about constellations n' stuff, but I wanted to give you something you could look for. So we had something we could look at together."
    God, they're the best. 
-> followup
= aquila
"Oh, Aquila? Yeah! It's got some cool symbolism of its own, but I think it's a little interesting that... I dunno if you can see Altair from here? It's... there."
You can't.
"It's part of the Summer Triangle!"
* "That's... a different constellation?"
    "Not exactly, but it IS an asterism, a collection of stars. Altair, Deneb, Vega, all the brightest stars of their contellations. The three stars are important in ceremony, navigation, myth. I think it's neat!
    -> followup
= followup
    +[Look at the stars.]
    -> stars
* "You gonna tell me my horoscope?"
    {advance_time(1)}
    They roll their eyes but keep smiling.
    "No. That's boring. This is more fun."
    Guess that's sorted, then.
* {cassiopeia}"Why not the Big Dipper?"
    {advance_time(1)}
    "Everyone knows how to look for the Big Dipper. It's just... kinda there?"
    You don't, but you won't let them know that.
* {aquila}"All that for a random triangle?"
    {advance_time(1)}
    They smile, and you hear it before it comes. "YOU'RE a random triangle."
* "You really like this stuff, don't you?"
    {advance_time(1)}
    "YES." You can see their eyes light up, and then they're off, knees bouncing and hands twitching with joy. 
    "I mean, I think everyone should. Like, think about it for a minute! All of these supermassive giant balls of gas, so incredibly bright and dense and hot that we couldn't even imagine it, some further away than any of us could travel in a lifetime, and we can see them! And they're in this position because we're watching them on this specific day, on this specific spot, in this specific moment."
    ** "Yeah!"
        {change_mood(1)}
        {advance_time(1)}
        "And, and! We're not even seeing them how they are. It takes so, so incredibly long for the light from these stars to reach our eyes. Y'know Polaris? The North Star? We're seeing it 433 years in the past. We are LITERALLY seeing back in time!"
        You let them keep going - this isn't the first time you've heard this, and you know you're losing precious time together, but... god, this is the last time you're going to hear them say it, isn't it?
        - + [Look at the stars.]
    -> stars

== forget ==
"What?" They turn to you, eyes wide with worry. "Why would you think that?"
Oh, no. Oh, no, what did you do? Quick, they're expecting an answer.
* "It's just, uh... you're gonna be so far away, and somewhere so much bigger, y'know? You're gonna make a ton of new friends."
-> honest
* "Sorry, sorry! I just meant, like... you forget to put both shoes on when you left the house yesterday."
-> joke
* "Nothing, nothing, nevermind."
-> dodge
= honest
You regret saying that. They take one breath in and one long breath out and then take your hands.
* "What?"
{advance_time(1)}
    "Look, okay, I want you to know I'm not gonna forget you. That'd be like forgetting my mom. I would die. You would die. Lotsa carnage. Genuinely, I would never. Do you want me to, like, set a reminder in my phone? Would that help?"
    ** "No, it's okay. You saying this helps."
    It really does. God, you love them.
    *** "...Thank you."
        "Anytime, seriously," they say, expression warm but still serious. They let go of your hands, then, and stare back up at the sky.
        ++++ [Look at the stars.]
        -> stars
= joke
For a second, you can see that they're still concerned, but then they smile. "HAH! Yeah, I guess you're right. But that's why I need YOU, y'know? You think I'm suddenly gonna become the productive one overnight?"
 * "Yeah, I guess you're right. What would you do without me?"
 "Probably not much," they say, and then turn back to the sky.
 ++ [Look at the stars.]
 -> stars
= dodge
~ mood -= 1
They're not buying it. "...Okay. Um. If you're sure." They turn back to the stars, still a little unsatisfied.
+ [Look at the stars.]
-> stars

== first_thing ==
"Ooh, tough one." They grin, thinking for a moment. "Eh. Probably sleep."
* "Really? First thing you're gonna do is sleep?"
    "Yup." They look a little too satisfied with themself. You probably should've expected it.
    ** "Okay, then first thing AFTER you sleep?"
        "...I don't know. Can... can we talk about something else? I don't wanna think about it right now."
        *** "Yeah, of course. Like what?"
        -> let_go
        *** "What's wrong?"
        -> push
= push
"I don't want to talk about it." There's an edge in their tone.
* "Sorry. We can talk about something else."
{advance_time}{change_mood(-0.5)}
    "Thanks. How about, uhhh... -> let_go
* "How am I supposed to help if you won't tell me what's wrong?"
    "I don't want you to help. I want you to change the subject."
    ** "I-"
        "STOP." There are barbs in their words strong enough to cut diamonds.
        {change_mood(-1)} {advance_time(1)}
        **** "..."
            "..."
            ***** "Sorry. I'm sorry."
            "It's fine. You're fine. I'm sorry, too."
            ++++++ [Look at the stars.]
            -> stars
-> END 
= let_go
{not push: "Uhh...<>}
"Oh! Oh, I know! I've been making these friendship bracelets, see?"
They extend out their wrist, revealing a colorful bracelet made from colored thread... embroidery thread? You forget the term.
* "Oh, look at that! How d'you make them?"
{advance_time(1)}
    "It's all knots! You take embroidery floss, and you put in a loom - I just used a clipboard - and then you tie a million knots in a pattern. I actually brought my stuff up here in case I needed to fiddle with something."
    
    Before you can stop myself, you ask,
    ** "Could you make me one?"
    {change_mood(1)}
    "I was just gonna say the same thing!" they shout, eyes locked with yours.
    They take out a repurposed tackle box and a clipboard and take out several colors of embroidery floss. They hold them out to you. "Pick three!"
    You can't tell any of them apart in the dark.
    *** "Uhh... this one, this one, and that one."
        You point to three random colors and hope they make sense together. "Got it! {bracelet_colors_nice == 1:These're gonna look really nice together, good eye!"|This... might look weird, but we'll make it work."} Soon enough, they've got everything set up and have started tieing infinitesimal knots.
        ~ bracelet_time = 2
        ++++ [Look at the stars.]
        -> stars
-> END

== sleep ==
You take your eyes off of your friend and notice... they're getting heavy. You wanted to spend all night stargazing, but... maybe some sleep wouldn't be the worst thing in the world. Before you even realize it, you've fallen asleep on your friend's shoulder. You aren't awake to notice, but they don't seem to mind. This is nice.
-> END







