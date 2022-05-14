// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inconsistency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InconsistencyModel _$InconsistencyModelFromJson(Map<String, dynamic> json) =>
    InconsistencyModel(
      id: json['id'] as String?,
      finding_desc: json['finding_desc'] as String?,
      clause: json['clause'] as String?,
      root: json['root'] as String?,
      counter: json['counter'] as String?,
      counter_end_date: json['counter_end_date'] as String?,
      situation: json['situation'] as String?,
      status: json['status'] as String?,
      create_date: json['create_date'] as String?,
      ca: json['ca'] as String?,
      moc: json['moc'] as String?,
      title: json['title'] as String?,
      whoms: json['whoms'] as String?,
      kis_send_raised_date: json['kis_send_raised_date'] as String?,
      accept_raised_date: json['accept_raised_date'] as String?,
      root_team: json['root_team'] as String?,
      comp_date: json['comp_date'] as String?,
      raised_send_date_kis: json['raised_send_date_kis'] as String?,
      kis_send_person_date: json['kis_send_person_date'] as String?,
      person_accept_date: json['person_accept_date'] as String?,
      causes_desc: json['causes_desc'] as String?,
      corrective: json['corrective'] as String?,
      correction: json['correction'] as String?,
      person_send_kis_date: json['person_send_kis_date'] as String?,
      kis_send_final_raised: json['kis_send_final_raised'] as String?,
      raised_send_final_kis: json['raised_send_final_kis'] as String?,
      kis_send_final_writer_date: json['kis_send_final_writer_date'] as String?,
      writer_send_final_kis_date: json['writer_send_final_kis_date'] as String?,
      document: json['document'] as String?,
      desc: json['desc'] as String?,
      end_date: json['end_date'] as String?,
      kis_send_date_corrective: json['kis_send_date_corrective'] as String?,
      corrective_accept_date: json['corrective_accept_date'] as String?,
      corrective_send_kis_date: json['corrective_send_kis_date'] as String?,
      protest_desc: json['protest_desc'] as String?,
      protest_date: json['protest_date'] as String?,
      create_user_id: json['create_user_id'] as String?,
      create_user_name: json['create_user_name'] as String?,
      create_user_status: json['create_user_status'] as String?,
      create_user_mail: json['create_user_mail'] as String?,
      create_user_phone: json['create_user_phone'] as String?,
      create_user_status_id: json['create_user_status_id'] as String?,
      create_user_section_id: json['create_user_section_id'] as String?,
      create_user_position_id: json['create_user_position_id'] as String?,
      create_user_authority_id: json['create_user_authority_id'] as String?,
      finding_id: json['finding_id'] as String?,
      finding_name: json['finding_name'] as String?,
      finding_status: json['finding_status'] as String?,
      raised_id: json['raised_id'] as String?,
      raised_name: json['raised_name'] as String?,
      raised_status: json['raised_status'] as String?,
      applies_id: json['applies_id'] as String?,
      applies_name: json['applies_name'] as String?,
      applies_status: json['applies_status'] as String?,
      accept_raised_id: json['accept_raised_id'] as String?,
      accept_raised_name: json['accept_raised_name'] as String?,
      accept_raised_status: json['accept_raised_status'] as String?,
      accept_raised_mail: json['accept_raised_mail'] as String?,
      accept_raised_phone: json['accept_raised_phone'] as String?,
      accept_raised_status_id: json['accept_raised_status_id'] as String?,
      accept_raised_section_id: json['accept_raised_section_id'] as String?,
      accept_raised_position_id: json['accept_raised_position_id'] as String?,
      accept_raised_authority_id: json['accept_raised_authority_id'] as String?,
      person_id: json['person_id'] as String?,
      person_name: json['person_name'] as String?,
      person_status: json['person_status'] as String?,
      person_mail: json['person_mail'] as String?,
      person_phone: json['person_phone'] as String?,
      person_status_id: json['person_status_id'] as String?,
      person_section_id: json['person_section_id'] as String?,
      person_position_id: json['person_position_id'] as String?,
      person_authority_id: json['person_authority_id'] as String?,
      causes_id: json['causes_id'] as String?,
      causes_name: json['causes_name'] as String?,
      causes_status: json['causes_status'] as String?,
      corrective_user_id: json['corrective_user_id'] as String?,
      corrective_user_name: json['corrective_user_name'] as String?,
      corrective_user_status: json['corrective_user_status'] as String?,
      corrective_user_mail: json['corrective_user_mail'] as String?,
      corrective_user_phone: json['corrective_user_phone'] as String?,
      corrective_user_status_id: json['corrective_user_status_id'] as String?,
      corrective_user_section_id: json['corrective_user_section_id'] as String?,
      corrective_user_position_id:
          json['corrective_user_position_id'] as String?,
      corrective_user_authority_id:
          json['corrective_user_authority_id'] as String?,
      section_id: json['section_id'] as String?,
      section_name: json['section_name'] as String?,
      section_status: json['section_status'] as String?,
      corrective_section_id: json['corrective_section_id'] as String?,
      corrective_section_name: json['corrective_section_name'] as String?,
      corrective_status: json['corrective_status'] as String?,
      undersection_id: json['undersection_id'] as String?,
      undersection_name: json['undersection_name'] as String?,
      undersection_status: json['undersection_status'] as String?,
      protest_user_id: json['protest_user_id'] as String?,
      protest_user_name: json['protest_user_name'] as String?,
      protest_user_status: json['protest_user_status'] as String?,
      protest_user_mail: json['protest_user_mail'] as String?,
      protest_user_phone: json['protest_user_phone'] as String?,
      protest_user_status_id: json['protest_user_status_id'] as String?,
      protest_user_section_id: json['protest_user_section_id'] as String?,
      protest_user_position_id: json['protest_user_position_id'] as String?,
      protest_user_authority_id: json['protest_user_authority_id'] as String?,
    );

Map<String, dynamic> _$InconsistencyModelToJson(InconsistencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'finding_desc': instance.finding_desc,
      'clause': instance.clause,
      'root': instance.root,
      'counter': instance.counter,
      'counter_end_date': instance.counter_end_date,
      'situation': instance.situation,
      'status': instance.status,
      'create_date': instance.create_date,
      'ca': instance.ca,
      'moc': instance.moc,
      'title': instance.title,
      'whoms': instance.whoms,
      'kis_send_raised_date': instance.kis_send_raised_date,
      'accept_raised_date': instance.accept_raised_date,
      'root_team': instance.root_team,
      'comp_date': instance.comp_date,
      'raised_send_date_kis': instance.raised_send_date_kis,
      'kis_send_person_date': instance.kis_send_person_date,
      'person_accept_date': instance.person_accept_date,
      'causes_desc': instance.causes_desc,
      'corrective': instance.corrective,
      'correction': instance.correction,
      'person_send_kis_date': instance.person_send_kis_date,
      'kis_send_final_raised': instance.kis_send_final_raised,
      'raised_send_final_kis': instance.raised_send_final_kis,
      'kis_send_final_writer_date': instance.kis_send_final_writer_date,
      'writer_send_final_kis_date': instance.writer_send_final_kis_date,
      'document': instance.document,
      'desc': instance.desc,
      'end_date': instance.end_date,
      'kis_send_date_corrective': instance.kis_send_date_corrective,
      'corrective_accept_date': instance.corrective_accept_date,
      'corrective_send_kis_date': instance.corrective_send_kis_date,
      'protest_desc': instance.protest_desc,
      'protest_date': instance.protest_date,
      'create_user_id': instance.create_user_id,
      'create_user_name': instance.create_user_name,
      'create_user_status': instance.create_user_status,
      'create_user_mail': instance.create_user_mail,
      'create_user_phone': instance.create_user_phone,
      'create_user_status_id': instance.create_user_status_id,
      'create_user_section_id': instance.create_user_section_id,
      'create_user_position_id': instance.create_user_position_id,
      'create_user_authority_id': instance.create_user_authority_id,
      'finding_id': instance.finding_id,
      'finding_name': instance.finding_name,
      'finding_status': instance.finding_status,
      'raised_id': instance.raised_id,
      'raised_name': instance.raised_name,
      'raised_status': instance.raised_status,
      'applies_id': instance.applies_id,
      'applies_name': instance.applies_name,
      'applies_status': instance.applies_status,
      'accept_raised_id': instance.accept_raised_id,
      'accept_raised_name': instance.accept_raised_name,
      'accept_raised_status': instance.accept_raised_status,
      'accept_raised_mail': instance.accept_raised_mail,
      'accept_raised_phone': instance.accept_raised_phone,
      'accept_raised_status_id': instance.accept_raised_status_id,
      'accept_raised_section_id': instance.accept_raised_section_id,
      'accept_raised_position_id': instance.accept_raised_position_id,
      'accept_raised_authority_id': instance.accept_raised_authority_id,
      'person_id': instance.person_id,
      'person_name': instance.person_name,
      'person_status': instance.person_status,
      'person_mail': instance.person_mail,
      'person_phone': instance.person_phone,
      'person_status_id': instance.person_status_id,
      'person_section_id': instance.person_section_id,
      'person_position_id': instance.person_position_id,
      'person_authority_id': instance.person_authority_id,
      'causes_id': instance.causes_id,
      'causes_name': instance.causes_name,
      'causes_status': instance.causes_status,
      'corrective_user_id': instance.corrective_user_id,
      'corrective_user_name': instance.corrective_user_name,
      'corrective_user_status': instance.corrective_user_status,
      'corrective_user_mail': instance.corrective_user_mail,
      'corrective_user_phone': instance.corrective_user_phone,
      'corrective_user_status_id': instance.corrective_user_status_id,
      'corrective_user_section_id': instance.corrective_user_section_id,
      'corrective_user_position_id': instance.corrective_user_position_id,
      'corrective_user_authority_id': instance.corrective_user_authority_id,
      'section_id': instance.section_id,
      'section_name': instance.section_name,
      'section_status': instance.section_status,
      'corrective_section_id': instance.corrective_section_id,
      'corrective_section_name': instance.corrective_section_name,
      'corrective_status': instance.corrective_status,
      'undersection_id': instance.undersection_id,
      'undersection_name': instance.undersection_name,
      'undersection_status': instance.undersection_status,
      'protest_user_id': instance.protest_user_id,
      'protest_user_name': instance.protest_user_name,
      'protest_user_status': instance.protest_user_status,
      'protest_user_mail': instance.protest_user_mail,
      'protest_user_phone': instance.protest_user_phone,
      'protest_user_status_id': instance.protest_user_status_id,
      'protest_user_section_id': instance.protest_user_section_id,
      'protest_user_position_id': instance.protest_user_position_id,
      'protest_user_authority_id': instance.protest_user_authority_id,
    };
