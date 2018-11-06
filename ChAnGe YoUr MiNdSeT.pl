%------------- The Gryffindor Table -------------

sits_right_of(katie_bell,pavarti_patil).
sits_right_of(pavarti_patil,lavender_brown).
sits_right_of(lavender_brown,neville_longbottom).
sits_right_of(neville_longbottom,alicia_spinnet).
sits_right_of(alicia_spinnet,fred_weasly).
sits_right_of(fred_weasly,george_weasly).
sits_right_of(george_weasly,lee_jordan).
sits_right_of(lee_jordan,dennis_creevey).
sits_right_of(dennis_creevey,dean_thomas).
sits_right_of(dean_thomas,ginny_weasly).
sits_right_of(ginny_weasly,angelina_johnson).
sits_right_of(angelina_johnson,seamus_finnigan).
sits_right_of(seamus_finnigan,colin_creevey).
sits_right_of(colin_creevey,harry_potter).
sits_right_of(harry_potter,hermione_granger).
sits_right_of(hermione_granger,ron_weasly).
sits_right_of(ron_weasly,natalie_mcdonald).
sits_right_of(natalie_mcdonald,katie_bell).

sits_left_of(X,Y):-sits_right_of(Y,X).

are_neighbors_of(X,Y,Z):-sits_left_of(X,Z),sits_right_of(Y,Z).

next_to_each_other(X,Y):-sits_right_of(X,Y).
next_to_each_other(X,Y):-sits_left_of(X,Y).

sits_right_two_sides_of(X,Y):-sits_right_of(X,Z),sits_right_of(Z,Y).

is_between_of(X,Y,Z):-are_neighbors_of(X,Y,Z).
is_between_of(X,Y,Z):-are_neighbors_of(Y,X,Z).

%Queries
%sits_right_of(lavender_brown,pavarati_patil)
%sits_right_of(lavender_brown,neville_longbottom)
%sits_right_of(Who,hermione_granger)
%sits_right_of(Who,_)
%sits_right_two_sides_of(Who,hermione_granger)
%is_between_of(neville_longbottom,fred_weasly,Who)

%------------- Family Relationships -------------
male(paul).
male(albert).
male(vernon).
male(james).
male(harry).
male(dudley).
female(helen).
female(ruth).
female(petunia).
female(lili).

parent_of(vernon,dudley).
parent_of(petunia,dudley).
parent_of(paul,petunia).
parent_of(helen,petunia).
parent_of(paul,lili).
parent_of(helen,lili).
parent_of(lili,harry).
parent_of(james,harry).
parent_of(albert,james).
parent_of(ruth,james).

father_of(Father, Child):-parent_of(Father,Child),male(Father).
mother_of(Mother, Child):-parent_of(Mother,Child),female(Mother).
grandfather_of(Grandfather, Child):-father_of(Grandfather,Parent),parent_of(Parent,Child).
grandmother_of(Grandmother, Child):-mother_of(Grandmother,Parent),parent_of(Parent,Child).
sibiling_of(Sibiling, Person):-parent_of(Parent,Person),parent_of(Parent,Sibiling),Person\=Sibiling.
sister_of(Sister, Person):-sibiling_of(Sister,Person),female(Sister).
brother_of(Brother,Person):-sibiling_of(Brother,Person),male(Brother).
aunt_of(Aunt, Person):-parent_of(Parent,Person),sister_of(Aunt,Parent).
uncle_of(Uncle, Person):-parent_of(Parent,Person),brother_of(Uncle,Parent).
ancestor_of(Ancestor,Person):-parent_of(Ancestor,Child), ancestor_of(Child,Person).
grandparents_of(Grandma,Grandpa,Person):-grandmother_of(Grandma,Person).
grandparents_of(Grandma,Grandpa,Person):-grandfather_of(Grandpa, Person).

%Queries
%aunt_of(Who,harry)
%grandparents_of(Grandma,Grandpa,harry)
%grandparents_of(helen,paul,Who)
%sister_of(Who,james)
%Queries
%aunt_of(Who,harry)
%grandparents_of(Grandma,Grandpa,harry)
%grandparents_of(paul,helen,Who)
%sister_of(Who,james)

%------------- Tomorrow's Lunch -------------
starter(green_salad).
starter(melon).
starter(tomato_salad).
starter(rabbit_pate).
main(rock_salmon_with_mayonnaise_and_capers).
main(roast_beef_with_girolle_mushroom_sauce).
main(pasta_courgette_and_cheese_bake).
dessert(cheese).
dessert(yoghurt).
dessert(paris_brest_pastry).

hungry(Starter,Main,Dessert):-starter(Starter),main(Main),dessert(Dessert).
not_so_hungry(Main,Other):-main(Main),starter(Other).
not_so_hungry(Main,Other):-main(Main),dessert(Other).
on_diet(Starter):-starter(Starter).

status(hungry).
status(not_so_hungry).
status(on_diet).

menu(Status,X,Y,Z):-status(Status),hungry(X,Y,Z),Status=hungry.
menu(Status,X,Y,Z):-status(Status),not_so_hungry(Y,X),Status=not_so_hungry.
menu(Status,X,Y,Z):-status(Status),not_so_hungry(Y,Z),Status=not_so_hungry.
menu(Status,X,Y,Z):-status(Status),on_diet(X),Status=on_diet.

%------------- Finding paths through a maze -------------
path(1,2).
path(3,4).
path(5,6).
path(7,8).
path(9,10).
path(12,13).
path(13,14).
path(15,16).
path(17,18).
path(19,20).
path(4,1).
path(6,3).
path(4,7).
path(6,11).
path(14,9).
path(11,15).
path(16,12).
path(14,17).
path(16,19).

path(X,Y):-path(X,Z),path(Z,Y).