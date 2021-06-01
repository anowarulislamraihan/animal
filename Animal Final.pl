go :- hypothesize(Animal), 
       write('I guess that the animal is: '), 
       write(Animal), nl, undo.

 /* hypotheses to be tested */ 
hypothesize(lion) :- lion, !. 
hypothesize(cheetah) :- cheetah, !. 
hypothesize(giraffe) :- giraffe, !. 
hypothesize(zebra) :- zebra, !. 
hypothesize(human) :- human, !. 
hypothesize(ostrich) :- ostrich, !. 
hypothesize(penguin) :- penguin, !. 
hypothesize(albatross) :- albatross, !. 
hypothesize(vulture) :- vulture, !.
hypothesize(bear) :- bear, !.
hypothesize(duck) :- duck, !.
hypothesize(horse) :- horse, !.
hypothesize(elephant) :- elephant, !.
hypothesize(unknown). /* no diagnosis */ 

/* animal identification rules */
lion    :- mammal, carnivore,
            verify(king_of_the_jungle), 
            verify(sounds_roar).
cheetah :- mammal, carnivore, 
                verify(has_tawny_color), 
                verify(has_dark_spots).  
bear  :-  mammal, omnivore,
            verify(has_fur),
            verify(sounds_growl).
giraffe :- mammal, ungulate, herbivore,
               verify(has_long_neck), 
               verify(has_long_legs). 
zebra :-   mammal, ungulate, herbivore,
             verify(has_black_stripes). 
horse:-   mammal, herbivore, ungulate,
            verify(runs_fast),
            verify(has_binocular_vision),
            verify(has_peripherial_vision).
human :-    mammal, omnivore,
            verify(smartest_animal),
            verify(has_complete_brain),
            verify(feed_babys_breast_milk).
elephant:-  mammal, herbivore,
            verify(largent_land_animal),
            verify(has_powerful_trunk),
            verify(has_tooth_shell).
ostrich :- bird, 
               verify(does_not_fly), 
               verify(has_long_neck), 
               verify(longest_egg), 
               verify(largest_bird). 
penguin :- bird, 
                 verify(does_not_fly), 
                 verify(swims), 
                 verify(is_black_and_white). 
duck    :-  bird,
                 verify(does_not_fly),
                 verify(swims),
                 verify(sounds_quack).
vulture :-  bird, carnivore,
                 verify(flys_well),
                 verify(has_long_neck),
                 verify(eats_dead_animal).
albatross :- bird, 
                   verify(appears_in_story_Ancient_Mariner), 
                   verify(flys_well). 
/* classification rules */
mammal :- verify(has_hair), !.  
mammal :- verify(gives_milk), 
          verify(birth_babys).
bird :- verify(has_feathers), !. 
bird :- verify(flys), 
           verify(lays_eggs). 
carnivore :- verify(has_pointed_teeth), 
              verify(has_claws), 
              verify(eats_meat), !. 
carnivore :-  verify(has_pointed_beak),
              verify(has_claws),
              verify(eats_meat). 
herbivore :- verify(eats_herb),
              verify(has_blunt_teeth).
omnivore  :-  verify(has_blunt_beak), !.
omnivore  :-  verify(has_canine_teeth),
              verify(eats_herb),
              verify(eats_meat).

ungulate :- mammal, verify(has_hooves), !. 
ungulate :- mammal, verify(chews_cud). 
/* how to ask questions */ 
ask(Question) :- 
        write('Does the animal have the following attribute: '), 
        write(Question), write('? '), 
         read(Response), nl, 
         ( (Response == yes ; Response == y) 
         -> assert(yes(Question)) ; 
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1. 
/* How to verify something */ 
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 
/* undo all yes/no assertions */ 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo. 