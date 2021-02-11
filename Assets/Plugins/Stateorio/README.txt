****************************************
*                                      *
*              STATEORIO               *
*                                      *
****************************************

Hello, and thank you for downloading Stateorio.

Stateorio is a C# implementation of Finite State Machines in Unity. Finite State Machines are a mathematical 
model often used in games, very commonly in developing AI. An FSM is composed of a certain number of 
states, each state having its own behaviour. At every update, FSM is in exactly one state.

Each state has transitions leading away from it to other states. A transition will occur when its 
condition is satisfied, changing the FSM's current state. States also have operations executed when 
they are entered or left. In Stateorio, FSMs also have a global state - a list of transitions which 
are possible in addition to the transitions of any state the FSM is currently inside.

For more on FSMs go here: https://en.wikipedia.org/wiki/Finite-state_machine

/--------------------------------------\
|               SCRIPTS                |
\--------------------------------------/

Scripts are in Stateorio/Components directory. In Stateorio, every element of an FSM is represented by 
a component. This makes it much easier to create and edit FSMs through Unity editor. The three main 
components are: FsmCore, FsmState and FsmCondition.

FsmCore is the central component, representing an entire FSM. It contains all of the states and transitions.

FsmState represents a state. It has methods called on state entry and leave. It is an abstract class - derive 
from it and make your own state.

FsmCondition represents a condition which when satisfied will fire a state transition. This one is also 
an abstract class - you need to derive from it to create your own conditions.

When using Stateorio, you will develop your states and conditions. Then, you will insert FsmCore into 
a game object and feed it with states and transition information. State and condition components don't 
necessarily have to belong to the same object as FsmCore. Global state transitions are valid regardless 
of the current state.

Transitions have priorities. If multiple transition condition's are satisfied, a transition with the largest
priority will take place. You can also set transitions to happen when their condition is NOT satisfied.

You don't have to use conditions and transitions. FsmCore has a method ChangeState() you can use to programmatically 
go into the desired state.

Make sure to test out your state machines! The editor should make it easy to reedit the FSM architecture 
if you make a mistake.

There are other scripts to make your life easier. I suggest looking into FsmCondPolled, as it is very handy.

/--------------------------------------\
|               EXAMPLE                |
\--------------------------------------/

In Stateorio/Example you will find an example subproject demonstrating usage of Stateorio. This is a very 
simplistic stealth-based first person game. There are three enemies patrolling a level and you need to kill 
them all.

After you have played it, go through the scripts used in the example, primarily those in Scripts/Enemy subdirectory. 
They are commented to explain how they made use of Stateorio scripts.
