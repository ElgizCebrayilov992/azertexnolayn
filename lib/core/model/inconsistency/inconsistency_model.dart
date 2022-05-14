
import 'package:json_annotation/json_annotation.dart';

part 'inconsistency_model.g.dart';

@JsonSerializable()
class InconsistencyModel {

String? id;
  String? finding_desc;
  String? clause;
  String? root;
  String? counter;
  String? counter_end_date;
  String? situation;
  String? status;
  String? create_date;
  String? ca;
  String? moc;
  String? title;
  String? whoms;
  String? kis_send_raised_date;
  String? accept_raised_date;
  String? root_team;
  String? comp_date;
  String? raised_send_date_kis;
  String? kis_send_person_date;
  String? person_accept_date;
  String? causes_desc;
  String? corrective;
  String? correction;
  String? person_send_kis_date;
  String? kis_send_final_raised;
  String? raised_send_final_kis;
  String? kis_send_final_writer_date;
  String? writer_send_final_kis_date;
  String? document;
  String? desc;
  String? end_date;
  String? kis_send_date_corrective;
  String? corrective_accept_date;
  String? corrective_send_kis_date;
  String? protest_desc;
  String? protest_date;
  String? create_user_id;
  String? create_user_name;
  String? create_user_status;
  String? create_user_mail;
  String? create_user_phone;
  String? create_user_status_id;
  String? create_user_section_id;
  String? create_user_position_id;
  String? create_user_authority_id;
  String? finding_id;
  String? finding_name;
  String? finding_status;
  String? raised_id;
  String? raised_name;
  String? raised_status;
  String? applies_id;
  String? applies_name;
  String? applies_status;
  String? accept_raised_id;
  String? accept_raised_name;
  String? accept_raised_status;
  String? accept_raised_mail;
  String? accept_raised_phone;
  String? accept_raised_status_id;
  String? accept_raised_section_id;
  String? accept_raised_position_id;
  String? accept_raised_authority_id;
  String? person_id;
  String? person_name;
  String? person_status;
  String? person_mail;
  String? person_phone;
  String? person_status_id;
  String? person_section_id;
  String? person_position_id;
  String? person_authority_id;
  String? causes_id;
  String? causes_name;
  String? causes_status;
  String? corrective_user_id;
  String? corrective_user_name;
  String? corrective_user_status;
  String? corrective_user_mail;
  String? corrective_user_phone;
  String? corrective_user_status_id;
  String? corrective_user_section_id;
  String? corrective_user_position_id;
  String? corrective_user_authority_id;
  String? section_id;
  String? section_name;
  String? section_status;
  String? corrective_section_id;
  String? corrective_section_name;
  String? corrective_status;
  String? undersection_id;
  String? undersection_name;
  String? undersection_status;
  String? protest_user_id;
  String? protest_user_name;
  String? protest_user_status;
  String? protest_user_mail;
  String? protest_user_phone;
  String? protest_user_status_id;
  String? protest_user_section_id;
  String? protest_user_position_id;
  String? protest_user_authority_id;
  String? get getId => this.id;

 set setId(String? id) => this.id = id;

  get findingdesc => this.finding_desc;

 set findingdesc( value) => this.finding_desc = value;

  get getClause => this.clause;

 set setClause( clause) => this.clause = clause;

  get getRoot => this.root;

 set setRoot( root) => this.root = root;

  get getCounter => this.counter;

 set setCounter( counter) => this.counter = counter;

  get counterend_date => this.counter_end_date;

 set counterend_date( value) => this.counter_end_date = value;

  get getSituation => this.situation;

 set setSituation( situation) => this.situation = situation;

  get getStatus => this.status;

 set setStatus( status) => this.status = status;

  get createdate => this.create_date;

 set createdate( value) => this.create_date = value;

  get getCa => this.ca;

 set setCa( ca) => this.ca = ca;

  get getMoc => this.moc;

 set setMoc( moc) => this.moc = moc;

  get getTitle => this.title;

 set setTitle( title) => this.title = title;

  get getWhoms => this.whoms;

 set setWhoms( whoms) => this.whoms = whoms;

  get kissend_raised_date => this.kis_send_raised_date;

 set kissend_raised_date( value) => this.kis_send_raised_date = value;

  get acceptraised_date => this.accept_raised_date;

 set acceptraised_date( value) => this.accept_raised_date = value;

  get rootteam => this.root_team;

 set rootteam( value) => this.root_team = value;

  get compdate => this.comp_date;

 set compdate( value) => this.comp_date = value;

  get raisedsend_date_kis => this.raised_send_date_kis;

 set raisedsend_date_kis( value) => this.raised_send_date_kis = value;

  get kissend_person_date => this.kis_send_person_date;

 set kissend_person_date( value) => this.kis_send_person_date = value;

  get personaccept_date => this.person_accept_date;

 set personaccept_date( value) => this.person_accept_date = value;

  get causesdesc => this.causes_desc;

 set causesdesc( value) => this.causes_desc = value;

  get getCorrective => this.corrective;

 set setCorrective( corrective) => this.corrective = corrective;

  get getCorrection => this.correction;

 set setCorrection( correction) => this.correction = correction;

  get personsend_kis_date => this.person_send_kis_date;

 set personsend_kis_date( value) => this.person_send_kis_date = value;

  get kissend_final_raised => this.kis_send_final_raised;

 set kissend_final_raised( value) => this.kis_send_final_raised = value;

  get raisedsend_final_kis => this.raised_send_final_kis;

 set raisedsend_final_kis( value) => this.raised_send_final_kis = value;

  get kissend_final_writer_date => this.kis_send_final_writer_date;

 set kissend_final_writer_date( value) => this.kis_send_final_writer_date = value;

  get writersend_final_kis_date => this.writer_send_final_kis_date;

 set writersend_final_kis_date( value) => this.writer_send_final_kis_date = value;

  get getDocument => this.document;

 set setDocument( document) => this.document = document;

  get getDesc => this.desc;

 set setDesc( desc) => this.desc = desc;

  get enddate => this.end_date;

 set enddate( value) => this.end_date = value;

  get kissend_date_corrective => this.kis_send_date_corrective;

 set kissend_date_corrective( value) => this.kis_send_date_corrective = value;

  get correctiveaccept_date => this.corrective_accept_date;

 set correctiveaccept_date( value) => this.corrective_accept_date = value;

  get correctivesend_kis_date => this.corrective_send_kis_date;

 set correctivesend_kis_date( value) => this.corrective_send_kis_date = value;

  get protestdesc => this.protest_desc;

 set protestdesc( value) => this.protest_desc = value;

  get protestdate => this.protest_date;

 set protestdate( value) => this.protest_date = value;

  get createuser_id => this.create_user_id;

 set createuser_id( value) => this.create_user_id = value;

  get createuser_name => this.create_user_name;

 set createuser_name( value) => this.create_user_name = value;

  get createuser_status => this.create_user_status;

 set createuser_status( value) => this.create_user_status = value;

  get createuser_mail => this.create_user_mail;

 set createuser_mail( value) => this.create_user_mail = value;

  get createuser_phone => this.create_user_phone;

 set createuser_phone( value) => this.create_user_phone = value;

  get createuser_status_id => this.create_user_status_id;

 set createuser_status_id( value) => this.create_user_status_id = value;

  get createuser_section_id => this.create_user_section_id;

 set createuser_section_id( value) => this.create_user_section_id = value;

  get createuser_position_id => this.create_user_position_id;

 set createuser_position_id( value) => this.create_user_position_id = value;

  get createuser_authority_id => this.create_user_authority_id;

 set createuser_authority_id( value) => this.create_user_authority_id = value;

  get findingid => this.finding_id;

 set findingid( value) => this.finding_id = value;

  get findingname => this.finding_name;

 set findingname( value) => this.finding_name = value;

  get findingstatus => this.finding_status;

 set findingstatus( value) => this.finding_status = value;

  get raisedid => this.raised_id;

 set raisedid( value) => this.raised_id = value;

  get raisedname => this.raised_name;

 set raisedname( value) => this.raised_name = value;

  get raisedstatus => this.raised_status;

 set raisedstatus( value) => this.raised_status = value;

  get appliesid => this.applies_id;

 set appliesid( value) => this.applies_id = value;

  get appliesname => this.applies_name;

 set appliesname( value) => this.applies_name = value;

  get appliesstatus => this.applies_status;

 set appliesstatus( value) => this.applies_status = value;

  get acceptraised_id => this.accept_raised_id;

 set acceptraised_id( value) => this.accept_raised_id = value;

  get acceptraised_name => this.accept_raised_name;

 set acceptraised_name( value) => this.accept_raised_name = value;

  get acceptraised_status => this.accept_raised_status;

 set acceptraised_status( value) => this.accept_raised_status = value;

  get acceptraised_mail => this.accept_raised_mail;

 set acceptraised_mail( value) => this.accept_raised_mail = value;

  get acceptraised_phone => this.accept_raised_phone;

 set acceptraised_phone( value) => this.accept_raised_phone = value;

  get acceptraised_status_id => this.accept_raised_status_id;

 set acceptraised_status_id( value) => this.accept_raised_status_id = value;

  get acceptraised_section_id => this.accept_raised_section_id;

 set acceptraised_section_id( value) => this.accept_raised_section_id = value;

  get acceptraised_position_id => this.accept_raised_position_id;

 set acceptraised_position_id( value) => this.accept_raised_position_id = value;

  get acceptraised_authority_id => this.accept_raised_authority_id;

 set acceptraised_authority_id( value) => this.accept_raised_authority_id = value;

  get personid => this.person_id;

 set personid( value) => this.person_id = value;

  get personname => this.person_name;

 set personname( value) => this.person_name = value;

  get personstatus => this.person_status;

 set personstatus( value) => this.person_status = value;

  get personmail => this.person_mail;

 set personmail( value) => this.person_mail = value;

  get personphone => this.person_phone;

 set personphone( value) => this.person_phone = value;

  get personstatus_id => this.person_status_id;

 set personstatus_id( value) => this.person_status_id = value;

  get personsection_id => this.person_section_id;

 set personsection_id( value) => this.person_section_id = value;

  get personposition_id => this.person_position_id;

 set personposition_id( value) => this.person_position_id = value;

  get personauthority_id => this.person_authority_id;

 set personauthority_id( value) => this.person_authority_id = value;

  get causesid => this.causes_id;

 set causesid( value) => this.causes_id = value;

  get causesname => this.causes_name;

 set causesname( value) => this.causes_name = value;

  get causesstatus => this.causes_status;

 set causesstatus( value) => this.causes_status = value;

  get correctiveuser_id => this.corrective_user_id;

 set correctiveuser_id( value) => this.corrective_user_id = value;

  get correctiveuser_name => this.corrective_user_name;

 set correctiveuser_name( value) => this.corrective_user_name = value;

  get correctiveuser_status => this.corrective_user_status;

 set correctiveuser_status( value) => this.corrective_user_status = value;

  get correctiveuser_mail => this.corrective_user_mail;

 set correctiveuser_mail( value) => this.corrective_user_mail = value;

  get correctiveuser_phone => this.corrective_user_phone;

 set correctiveuser_phone( value) => this.corrective_user_phone = value;

  get correctiveuser_status_id => this.corrective_user_status_id;

 set correctiveuser_status_id( value) => this.corrective_user_status_id = value;

  get correctiveuser_section_id => this.corrective_user_section_id;

 set correctiveuser_section_id( value) => this.corrective_user_section_id = value;

  get correctiveuser_position_id => this.corrective_user_position_id;

 set correctiveuser_position_id( value) => this.corrective_user_position_id = value;

  get correctiveuser_authority_id => this.corrective_user_authority_id;

 set correctiveuser_authority_id( value) => this.corrective_user_authority_id = value;

  get sectionid => this.section_id;

 set sectionid( value) => this.section_id = value;

  get sectionname => this.section_name;

 set sectionname( value) => this.section_name = value;

  get sectionstatus => this.section_status;

 set sectionstatus( value) => this.section_status = value;

  get correctivesection_id => this.corrective_section_id;

 set correctivesection_id( value) => this.corrective_section_id = value;

  get correctivesection_name => this.corrective_section_name;

 set correctivesection_name( value) => this.corrective_section_name = value;

  get correctivestatus => this.corrective_status;

 set correctivestatus( value) => this.corrective_status = value;

  get undersectionid => this.undersection_id;

 set undersectionid( value) => this.undersection_id = value;

  get undersectionname => this.undersection_name;

 set undersectionname( value) => this.undersection_name = value;

  get undersectionstatus => this.undersection_status;

 set undersectionstatus( value) => this.undersection_status = value;

  get protestuser_id => this.protest_user_id;

 set protestuser_id( value) => this.protest_user_id = value;

  get protestuser_name => this.protest_user_name;

 set protestuser_name( value) => this.protest_user_name = value;

  get protestuser_status => this.protest_user_status;

 set protestuser_status( value) => this.protest_user_status = value;

  get protestuser_mail => this.protest_user_mail;

 set protestuser_mail( value) => this.protest_user_mail = value;

  get protestuser_phone => this.protest_user_phone;

 set protestuser_phone( value) => this.protest_user_phone = value;

  get protestuser_status_id => this.protest_user_status_id;

 set protestuser_status_id( value) => this.protest_user_status_id = value;

  get protestuser_section_id => this.protest_user_section_id;

 set protestuser_section_id( value) => this.protest_user_section_id = value;

  get protestuser_position_id => this.protest_user_position_id;

 set protestuser_position_id( value) => this.protest_user_position_id = value;

  get protestuser_authority_id => this.protest_user_authority_id;

 set protestuser_authority_id( value) => this.protest_user_authority_id = value;

  InconsistencyModel({
    this.id,
    this.finding_desc,
    this.clause,
    this.root,
    this.counter,
    this.counter_end_date,
    this.situation,
    this.status,
    this.create_date,
    this.ca,
    this.moc,
    this.title,
    this.whoms,
    this.kis_send_raised_date,
    this.accept_raised_date,
    this.root_team,
    this.comp_date,
    this.raised_send_date_kis,
    this.kis_send_person_date,
    this.person_accept_date,
    this.causes_desc,
    this.corrective,
    this.correction,
    this.person_send_kis_date,
    this.kis_send_final_raised,
    this.raised_send_final_kis,
    this.kis_send_final_writer_date,
    this.writer_send_final_kis_date,
    this.document,
    this.desc,
    this.end_date,
    this.kis_send_date_corrective,
    this.corrective_accept_date,
    this.corrective_send_kis_date,
    this.protest_desc,
    this.protest_date,
    this.create_user_id,
    this.create_user_name,
    this.create_user_status,
    this.create_user_mail,
    this.create_user_phone,
    this.create_user_status_id,
    this.create_user_section_id,
    this.create_user_position_id,
    this.create_user_authority_id,
    this.finding_id,
    this.finding_name,
    this.finding_status,
    this.raised_id,
    this.raised_name,
    this.raised_status,
    this.applies_id,
    this.applies_name,
    this.applies_status,
    this.accept_raised_id,
    this.accept_raised_name,
    this.accept_raised_status,
    this.accept_raised_mail,
    this.accept_raised_phone,
    this.accept_raised_status_id,
    this.accept_raised_section_id,
    this.accept_raised_position_id,
    this.accept_raised_authority_id,
    this.person_id,
    this.person_name,
    this.person_status,
    this.person_mail,
    this.person_phone,
    this.person_status_id,
    this.person_section_id,
    this.person_position_id,
    this.person_authority_id,
    this.causes_id,
    this.causes_name,
    this.causes_status,
    this.corrective_user_id,
    this.corrective_user_name,
    this.corrective_user_status,
    this.corrective_user_mail,
    this.corrective_user_phone,
    this.corrective_user_status_id,
    this.corrective_user_section_id,
    this.corrective_user_position_id,
    this.corrective_user_authority_id,
    this.section_id,
    this.section_name,
    this.section_status,
    this.corrective_section_id,
    this.corrective_section_name,
    this.corrective_status,
    this.undersection_id,
    this.undersection_name,
    this.undersection_status,
    this.protest_user_id,
    this.protest_user_name,
    this.protest_user_status,
    this.protest_user_mail,
    this.protest_user_phone,
    this.protest_user_status_id,
    this.protest_user_section_id,
    this.protest_user_position_id,
    this.protest_user_authority_id,
  });
  factory InconsistencyModel.fromJson(Map<String, dynamic> json) =>_$InconsistencyModelFromJson(json);
  Map<String, dynamic> toJson() =>_$InconsistencyModelToJson(this);

 

  @override
  String toString() {
    return 'InconsistencyModel(id: $id, finding_desc: $finding_desc, clause: $clause, root: $root, counter: $counter, counter_end_date: $counter_end_date, situation: $situation, status: $status, create_date: $create_date, ca: $ca, moc: $moc, title: $title, whoms: $whoms, kis_send_raised_date: $kis_send_raised_date, accept_raised_date: $accept_raised_date, root_team: $root_team, comp_date: $comp_date, raised_send_date_kis: $raised_send_date_kis, kis_send_person_date: $kis_send_person_date, person_accept_date: $person_accept_date, causes_desc: $causes_desc, corrective: $corrective, correction: $correction, person_send_kis_date: $person_send_kis_date, kis_send_final_raised: $kis_send_final_raised, raised_send_final_kis: $raised_send_final_kis, kis_send_final_writer_date: $kis_send_final_writer_date, writer_send_final_kis_date: $writer_send_final_kis_date, document: $document, desc: $desc, end_date: $end_date, kis_send_date_corrective: $kis_send_date_corrective, corrective_accept_date: $corrective_accept_date, corrective_send_kis_date: $corrective_send_kis_date, protest_desc: $protest_desc, protest_date: $protest_date, create_user_id: $create_user_id, create_user_name: $create_user_name, create_user_status: $create_user_status, create_user_mail: $create_user_mail, create_user_phone: $create_user_phone, create_user_status_id: $create_user_status_id, create_user_section_id: $create_user_section_id, create_user_position_id: $create_user_position_id, create_user_authority_id: $create_user_authority_id, finding_id: $finding_id, finding_name: $finding_name, finding_status: $finding_status, raised_id: $raised_id, raised_name: $raised_name, raised_status: $raised_status, applies_id: $applies_id, applies_name: $applies_name, applies_status: $applies_status, accept_raised_id: $accept_raised_id, accept_raised_name: $accept_raised_name, accept_raised_status: $accept_raised_status, accept_raised_mail: $accept_raised_mail, accept_raised_phone: $accept_raised_phone, accept_raised_status_id: $accept_raised_status_id, accept_raised_section_id: $accept_raised_section_id, accept_raised_position_id: $accept_raised_position_id, accept_raised_authority_id: $accept_raised_authority_id, person_id: $person_id, person_name: $person_name, person_status: $person_status, person_mail: $person_mail, person_phone: $person_phone, person_status_id: $person_status_id, person_section_id: $person_section_id, person_position_id: $person_position_id, person_authority_id: $person_authority_id, causes_id: $causes_id, causes_name: $causes_name, causes_status: $causes_status, corrective_user_id: $corrective_user_id, corrective_user_name: $corrective_user_name, corrective_user_status: $corrective_user_status, corrective_user_mail: $corrective_user_mail, corrective_user_phone: $corrective_user_phone, corrective_user_status_id: $corrective_user_status_id, corrective_user_section_id: $corrective_user_section_id, corrective_user_position_id: $corrective_user_position_id, corrective_user_authority_id: $corrective_user_authority_id, section_id: $section_id, section_name: $section_name, section_status: $section_status, corrective_section_id: $corrective_section_id, corrective_section_name: $corrective_section_name, corrective_status: $corrective_status, undersection_id: $undersection_id, undersection_name: $undersection_name, undersection_status: $undersection_status, protest_user_id: $protest_user_id, protest_user_name: $protest_user_name, protest_user_status: $protest_user_status, protest_user_mail: $protest_user_mail, protest_user_phone: $protest_user_phone, protest_user_status_id: $protest_user_status_id, protest_user_section_id: $protest_user_section_id, protest_user_position_id: $protest_user_position_id, protest_user_authority_id: $protest_user_authority_id)';
  }
}
