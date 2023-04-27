import 'Classroom.dart';
import 'Teacher.dart';

class Infra {
  List<Classroom> _classes = [];
  List<Teacher> _teachers = [];

  Infra();

  Infra.param(this._classes, this._teachers);

  List<Classroom> get classes => this._classes;
  set classes(List<Classroom> value) => this._classes = value;
  get teachers => this._teachers;
  set teachers(value) => this._teachers = value;
}
