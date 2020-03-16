class EnderecoModel {

  String cep;
  String logradouro;
  String bairro;
  
  EnderecoModel({
    this.cep,
    this.logradouro,
    this.bairro,
  });

  static EnderecoModel fromMap(Map<String, dynamic> map) {
    if(map == null) return null;

    return EnderecoModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      bairro: map[ 'bairro']
    );
  }

}
