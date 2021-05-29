class People{
   int id;
   String nome;
   String dataNascimento;
   String sexo;

   People({this.id,this.nome,this.sexo,this.dataNascimento});


   People.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      nome = json['nome'];
      dataNascimento = json['dataNascimento'];
      sexo = json['sexo'];
   }

   @override
   Map<String, dynamic> toMap() {
      Map<String, dynamic> data = Map();
      data["id"] = this.id;
      data["nome"] = this.nome;
      data["dataNascimento"] =  this.dataNascimento;
      data["sexo"] =this.sexo;
      return data;
   }
}