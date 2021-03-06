
    create table Artifact (
        id number(19,0) not null,
        content blob,
        contentEncoding varchar2(255 char),
        contentHash char(40),
        contentPath varchar2(255 char),
        contentSize number(19,0) not null,
        createdTime timestamp,
        createdByUsername varchar2(50 char),
        derived number(1,0) not null,
        description varchar2(255 char),
        expandedFromArchive number(1,0) not null,
        expandedFromArchivePath varchar2(255 char),
        mimeType varchar2(100 char),
        model varchar2(255 char),
        modifiedTime timestamp,
        modifiedByUsername varchar2(50 char),
        name varchar2(255 char),
        trashed number(1,0) not null,
        type varchar2(255 char),
        uuid char(36),
        version varchar2(255 char),
        derivedFrom_id number(19,0),
        expandedFrom_id number(19,0),
        primary key (id)
    );

    create table Artifact_classifiers (
        Artifact_id number(19,0) not null,
        classifiers varchar2(255 char)
    );

    create table Artifact_normalizedClassifiers (
        Artifact_id number(19,0) not null,
        normalizedClassifiers varchar2(255 char)
    );

    create table AuditEntry (
        id number(19,0) not null,
        lastActionTime timestamp,
        username varchar2(50 char),
        type varchar2(20 char),
        uuid char(36),
        artifact_id number(19,0),
        primary key (id)
    );

    create table AuditItem (
        id number(19,0) not null,
        type varchar2(20 char),
        auditEntry_id number(19,0),
        primary key (id)
    );

    create table AuditItem_properties (
        AuditItem_id number(19,0) not null,
        properties varchar2(255 char),
        properties_KEY varchar2(255 char),
        primary key (AuditItem_id, properties_KEY)
    );

    create table ArtifactComment (
        id number(19,0) not null,
        lastActionTime timestamp,
        username varchar2(50 char),
        text varchar2(255 char),
        artifact_id number(19,0) not null,
        primary key (id)
    );

    create table Document (
        id number(19,0) not null,
        primary key (id)
    );

    create table Ontology (
        surrogateId number(19,0) not null,
        base varchar2(255 char),
        annotation varchar2(255 char),
        createdBy varchar2(255 char),
        createdOn date,
        id varchar2(255 char),
        label varchar2(255 char),
        lastModifiedBy varchar2(255 char),
        lastModifiedOn date,
        uuid char(36),
        primary key (surrogateId)
    );

    create table OntologyClass (
        surrogateId number(19,0) not null,
        annotation varchar2(255 char),
        id varchar2(255 char),
        label varchar2(255 char),
        uri varchar2(255 char),
        parent_surrogateId number(19,0),
        root_surrogateId number(19,0),
        primary key (surrogateId)
    );

    create table Property (
        id number(19,0) not null,
        custom number(1,0) not null,
        propertyKey varchar2(255 char),
        propertyValue varchar2(255 char),
        owner_id number(19,0) not null,
        primary key (id)
    );

    create table Relationship (
        id number(19,0) not null,
        name varchar2(255 char),
        type number(10,0),
        owner_id number(19,0) not null,
        primary key (id)
    );

    create table Relationship_otherAttributes (
        Relationship_id number(19,0) not null,
        otherAttributes varchar2(255 char),
        otherAttributes_KEY varchar2(255 char),
        primary key (Relationship_id, otherAttributes_KEY)
    );

    create table StoredQuery (
        queryName varchar2(255 char) not null,
        queryExpression varchar2(255 char),
        primary key (queryName)
    );

    create table StoredQuery_propertyNames (
        StoredQuery_queryName varchar2(255 char) not null,
        propertyNames varchar2(255 char)
    );

    create table Target (
        id number(19,0) not null,
        targetType varchar2(255 char),
        relationship_id number(19,0) not null,
        target_id number(19,0) not null,
        primary key (id)
    );

    create table Target_otherAttributes (
        Target_id number(19,0) not null,
        otherAttributes varchar2(255 char),
        otherAttributes_KEY varchar2(255 char),
        primary key (Target_id, otherAttributes_KEY)
    );

    create table WsdlDerived (
        id number(19,0) not null,
        primary key (id)
    );

    create table WsdlDerived_WsdlDerived (
        WsdlDerived_id number(19,0) not null,
        extension_id number(19,0) not null
    );

    create table WsdlDocument (
        id number(19,0) not null,
        primary key (id)
    );

    create table WsdlDocument_Artifact (
        WsdlDocument_id number(19,0) not null,
        simpleTypes_id number(19,0) not null,
        elements_id number(19,0) not null,
        complexTypes_id number(19,0) not null,
        attributes_id number(19,0) not null
    );

    create table WsdlDocument_WsdlDerived (
        WsdlDocument_id number(19,0) not null,
        services_id number(19,0) not null,
        ports_id number(19,0) not null,
        portTypes_id number(19,0) not null,
        parts_id number(19,0) not null,
        operations_id number(19,0) not null,
        operationOutputs_id number(19,0) not null,
        operationInputs_id number(19,0) not null,
        messages_id number(19,0) not null,
        faults_id number(19,0) not null,
        extensions_id number(19,0) not null,
        bindings_id number(19,0) not null,
        bindingOperations_id number(19,0) not null,
        bindingOperationOutputs_id number(19,0) not null,
        bindingOperationInputs_id number(19,0) not null,
        bindingOperationFaults_id number(19,0) not null
    );

    create table XsdDocument (
        id number(19,0) not null,
        primary key (id)
    );

    create table XsdDocument_Artifact (
        XsdDocument_id number(19,0) not null,
        simpleTypes_id number(19,0) not null,
        elements_id number(19,0) not null,
        complexTypes_id number(19,0) not null,
        attributes_id number(19,0) not null
    );

    create index artifact_uuid_idx on Artifact (uuid, trashed);

    create index artifact_name_idx on Artifact (name, trashed);

    create index artifact_model_idx on Artifact (model, trashed);

    create index artifact_type_idx on Artifact (type, trashed);

    create index artifact_model_type_idx on Artifact (model, type, trashed);

    create index relationship_name_idx on Relationship (name);


    alter table WsdlDerived_WsdlDerived 
        add constraint UK_mqmkpiqop0cu4jdco09lq9ovq unique (extension_id);

    alter table WsdlDocument_Artifact 
        add constraint UK_otvk766m3of6vkmrln2bwyxhj unique (simpleTypes_id);

    alter table WsdlDocument_Artifact 
        add constraint UK_j0s1hqp47o0qowi8aiypitjvx unique (elements_id);

    alter table WsdlDocument_Artifact 
        add constraint UK_3nj0ti0qptltfho2kgcwm3hj8 unique (complexTypes_id);

    alter table WsdlDocument_Artifact 
        add constraint UK_f1os5u82f30vgx8lvd6dxmh01 unique (attributes_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_gb9laes1rvv4h2rqancigwbo3 unique (services_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_iwivhbovmjnseyl6e38lj60m2 unique (ports_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_s39943fx4ucrwfbt2a8br8v7q unique (portTypes_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_skalp1atlfqhpj36625ma739n unique (parts_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_bp9ulkv5w4xi6lhaw6kcpxx92 unique (operations_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_1nqvlk1otqwarv0l1ru7hf80r unique (operationOutputs_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_a4f075qkbhbeem67s9o1p1l0q unique (operationInputs_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_5dl84bk7msvd9n2w60cc9gk6n unique (messages_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_ougtts5r2yem3rlplxmdr6hyj unique (faults_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_he15kdi5khs4lck8bovniydea unique (extensions_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_msx8vttrwwdpa3c4v486vwsl0 unique (bindings_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_gp01udjl8tbhsb5f636acmw5f unique (bindingOperations_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_cyifrdhcs7ppe7ylft62frh6m unique (bindingOperationOutputs_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_sjlceeo60gc0w0ukl10fv34nx unique (bindingOperationInputs_id);

    alter table WsdlDocument_WsdlDerived 
        add constraint UK_1lgh2xc7nurmyfqcsj45c7657 unique (bindingOperationFaults_id);

    alter table XsdDocument_Artifact 
        add constraint UK_g1fwnuynjvfvdc0bhqtc7lsnf unique (simpleTypes_id);

    alter table XsdDocument_Artifact 
        add constraint UK_h3a7wjolu3yb7pnn85g7bgjc9 unique (elements_id);

    alter table XsdDocument_Artifact 
        add constraint UK_mrch35w1c4e3av7goxhgoje1w unique (complexTypes_id);

    alter table XsdDocument_Artifact 
        add constraint UK_4hw0cjxhdn9b8t9ikr4ljrfea unique (attributes_id);

    alter table Artifact 
        add constraint FK_5he8qx4p9didgdqewhvv0h65e 
        foreign key (derivedFrom_id) 
        references Artifact;

    alter table Artifact 
        add constraint FK_97yivnkksh67qtew2neenft4a 
        foreign key (expandedFrom_id) 
        references Artifact;

    alter table Artifact_classifiers 
        add constraint FK_3ksvuyo0tlsaj7r4jkbljs0fs 
        foreign key (Artifact_id) 
        references Artifact;

    alter table Artifact_normalizedClassifiers 
        add constraint FK_n2luspbu4i64tl1wjeirtp6kc 
        foreign key (Artifact_id) 
        references Artifact;

    alter table AuditEntry 
        add constraint FK_2lnlstjxd9rqmv67whu6u8mfy 
        foreign key (artifact_id) 
        references Artifact;

    alter table AuditItem 
        add constraint FK_20a0yevjg1j36b5m33chpx71q 
        foreign key (auditEntry_id) 
        references AuditEntry;

    alter table AuditItem_properties 
        add constraint FK_al7mxsh91w8jvkv2wsp00q84q 
        foreign key (AuditItem_id) 
        references AuditItem;

    alter table ArtifactComment 
        add constraint FK_lk7u6h2hivm5v2qx4q4iomjag 
        foreign key (artifact_id) 
        references Artifact;

    alter table Document 
        add constraint FK_e4ya5hv4c8gwqda1j9imen8cu 
        foreign key (id) 
        references Artifact;

    alter table OntologyClass 
        add constraint FK_f0jxuyajwpmer7x36eofvsbco 
        foreign key (parent_surrogateId) 
        references OntologyClass;

    alter table OntologyClass 
        add constraint FK_20x153qbwgv4ujef0uv1yx962 
        foreign key (root_surrogateId) 
        references Ontology;

    alter table Property 
        add constraint FK_9tdtxjyo0sbh14w7pf4lgcjt6 
        foreign key (owner_id) 
        references Artifact;

    alter table Relationship 
        add constraint FK_qgnwqh1inlf26nrlxvq0b1b93 
        foreign key (owner_id) 
        references Artifact;

    alter table Relationship_otherAttributes 
        add constraint FK_kgsapdnh8i7orp16hcwk6sng8 
        foreign key (Relationship_id) 
        references Relationship;

    alter table StoredQuery_propertyNames 
        add constraint FK_1b4vulcxxvdo68jm5ro88wmy7 
        foreign key (StoredQuery_queryName) 
        references StoredQuery;

    alter table Target 
        add constraint FK_ai25r336gchbabwphthei037 
        foreign key (relationship_id) 
        references Relationship;

    alter table Target 
        add constraint FK_i2hcu61dc77wjeurhmljwseyl 
        foreign key (target_id) 
        references Artifact;

    alter table Target_otherAttributes 
        add constraint FK_jjduupt3sotpqdbwlkgeetkme 
        foreign key (Target_id) 
        references Target;

    alter table WsdlDerived 
        add constraint FK_cjr4q2lqra7ajmmemtuv0qwhj 
        foreign key (id) 
        references Artifact;

    alter table WsdlDerived_WsdlDerived 
        add constraint FK_mqmkpiqop0cu4jdco09lq9ovq 
        foreign key (extension_id) 
        references WsdlDerived;

    alter table WsdlDerived_WsdlDerived 
        add constraint FK_iinooh16ic9iddggfq8qp6ibi 
        foreign key (WsdlDerived_id) 
        references WsdlDerived;

    alter table WsdlDocument 
        add constraint FK_olb8dn71bkv0003id8172sm2n 
        foreign key (id) 
        references Document;

    alter table WsdlDocument_Artifact 
        add constraint FK_otvk766m3of6vkmrln2bwyxhj 
        foreign key (simpleTypes_id) 
        references Artifact;

    alter table WsdlDocument_Artifact 
        add constraint FK_kud7h93gwnv1tb8ccef0kpyle 
        foreign key (WsdlDocument_id) 
        references WsdlDocument;

    alter table WsdlDocument_Artifact 
        add constraint FK_j0s1hqp47o0qowi8aiypitjvx 
        foreign key (elements_id) 
        references Artifact;

    alter table WsdlDocument_Artifact 
        add constraint FK_3nj0ti0qptltfho2kgcwm3hj8 
        foreign key (complexTypes_id) 
        references Artifact;

    alter table WsdlDocument_Artifact 
        add constraint FK_f1os5u82f30vgx8lvd6dxmh01 
        foreign key (attributes_id) 
        references Artifact;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_gb9laes1rvv4h2rqancigwbo3 
        foreign key (services_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_ghhcidjvqgivgb2k1usqg620u 
        foreign key (WsdlDocument_id) 
        references WsdlDocument;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_iwivhbovmjnseyl6e38lj60m2 
        foreign key (ports_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_s39943fx4ucrwfbt2a8br8v7q 
        foreign key (portTypes_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_skalp1atlfqhpj36625ma739n 
        foreign key (parts_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_bp9ulkv5w4xi6lhaw6kcpxx92 
        foreign key (operations_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_1nqvlk1otqwarv0l1ru7hf80r 
        foreign key (operationOutputs_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_a4f075qkbhbeem67s9o1p1l0q 
        foreign key (operationInputs_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_5dl84bk7msvd9n2w60cc9gk6n 
        foreign key (messages_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_ougtts5r2yem3rlplxmdr6hyj 
        foreign key (faults_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_he15kdi5khs4lck8bovniydea 
        foreign key (extensions_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_msx8vttrwwdpa3c4v486vwsl0 
        foreign key (bindings_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_gp01udjl8tbhsb5f636acmw5f 
        foreign key (bindingOperations_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_cyifrdhcs7ppe7ylft62frh6m 
        foreign key (bindingOperationOutputs_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_sjlceeo60gc0w0ukl10fv34nx 
        foreign key (bindingOperationInputs_id) 
        references WsdlDerived;

    alter table WsdlDocument_WsdlDerived 
        add constraint FK_1lgh2xc7nurmyfqcsj45c7657 
        foreign key (bindingOperationFaults_id) 
        references WsdlDerived;

    alter table XsdDocument 
        add constraint FK_plul74oxfdh4j7hi34hwferow 
        foreign key (id) 
        references Document;

    alter table XsdDocument_Artifact 
        add constraint FK_g1fwnuynjvfvdc0bhqtc7lsnf 
        foreign key (simpleTypes_id) 
        references Artifact;

    alter table XsdDocument_Artifact 
        add constraint FK_q7lklcfoq767xuoxbby7x8be7 
        foreign key (XsdDocument_id) 
        references XsdDocument;

    alter table XsdDocument_Artifact 
        add constraint FK_h3a7wjolu3yb7pnn85g7bgjc9 
        foreign key (elements_id) 
        references Artifact;

    alter table XsdDocument_Artifact 
        add constraint FK_mrch35w1c4e3av7goxhgoje1w 
        foreign key (complexTypes_id) 
        references Artifact;

    alter table XsdDocument_Artifact 
        add constraint FK_4hw0cjxhdn9b8t9ikr4ljrfea 
        foreign key (attributes_id) 
        references Artifact;

    create sequence hibernate_sequence;
