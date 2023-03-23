abstract class TodoStates {}

class InitialAppState extends TodoStates {}

class SetCurrentIndexAppState extends TodoStates {}
class NotesSuccessState extends TodoStates {}
class SetDateState extends TodoStates {}

class GetBobState extends TodoStates {}

class AddTotodosListState extends TodoStates {}


abstract class ThemeStates{}

class InitialThemeState extends ThemeStates{}

class ChangeModeState extends ThemeStates{}

