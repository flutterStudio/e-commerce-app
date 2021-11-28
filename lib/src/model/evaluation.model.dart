import 'package:e_commerce/src/middleware/model_serilizer.middleware.dart';
import 'package:e_commerce/src/model/user.model.dart';

import 'model.dart';

class Evaluation implements Model {
  int? id;
  String? comment;
  double? rate;
  User? user;

  Evaluation({this.id, this.comment});
  Evaluation.create({
    required this.comment,
    required this.rate,
  });
  @override
  ModelSerializer<Evaluation> serilizer() {
    return _EvaluationSerializer(this);
  }
}

class _EvaluationSerializer extends ModelSerializer<Evaluation> {
  _EvaluationSerializer(Evaluation model) : super(model);

  @override
  Evaluation fromJson(Map<String, dynamic> json) {
    model.id = json["evaluationId"];
    model.comment = json["comment"];
    model.rate = json["rate"];
    model.user = User().serilizer().fromJson(json["rate"]);
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "evaluationId": model.id,
      "comment": model.comment,
      "rate": model.rate,
    };
  }
}
