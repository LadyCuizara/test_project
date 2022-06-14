package com.g2ssid.ddh_g2ssid_api.resources.accident;


import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.domain.model.accident.*;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.util.Date;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author Michel Terrazas Mercado
 */
public class AccidentResource extends GenericResource<Accident> {

    private Long employeeId;

    /*tipo de accidente Dropdown*/
    private AccidentType accidentType;

    //descripción de accidente Text
    private String cause;

    //fecha de accidente DatePiker
    private Date dateInit;

    //evaluación de lesión Dropdown
    private Severity severity;

    //recibió primeros auxilios Dropdown
    private Receive receive;

    //reasigando a otra función Radiobutton
    private Assigned assigned;

    //Reincidencia RadioButton
    private Frecuency frecuency;


    //Turno Dropdown
    private Turn turn;

    //Formas de accidente Dropdown
    private WayType way;

    //Tipo de lesión Dropdown
    private KindType kind;

    //parte del cuerpo lesionada Dropdown
    private PartOfBody body;

    //Agente causante Dropdown
    private Factor factor;

    //Hubo tratamiento medico? RadioButton
    private Medication medication;

    //Inicio tiempo perdido Datepicker
    private Date startLostTime;

    //Fin tiempo perdido Datepacker
    private Date endLostTime;

    //Dias perdidos Text
    private String dayLost;

    //Dias debitados Text
    private String dayDebited;

    public AccidentType getAccidentType() {
        return accidentType;
    }

    public void setAccidentType(AccidentType accidentType) {
        this.accidentType = accidentType;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public Date getDateInit() {
        return dateInit;
    }

    public void setDateInit(Date dateInit) {
        this.dateInit = dateInit;
    }

    public Severity getSeverity() {
        return severity;
    }

    public void setSeverity(Severity severity) {
        this.severity = severity;
    }

    public Receive getReceive() {
        return receive;
    }

    public void setReceive(Receive receive) {
        this.receive = receive;
    }

    public Assigned getAssigned() {
        return assigned;
    }

    public void setAssigned(Assigned assigned) {
        this.assigned = assigned;
    }

    public Frecuency getFrecuency() {
        return frecuency;
    }

    public void setFrecuency(Frecuency frecuency) {
        this.frecuency = frecuency;
    }

    public Turn getTurn() {
        return turn;
    }

    public void setTurn(Turn turn) {
        this.turn = turn;
    }

    public WayType getWay() {
        return way;
    }

    public void setWay(WayType way) {
        this.way = way;
    }

    public KindType getKind() {
        return kind;
    }

    public void setKind(KindType kind) {
        this.kind = kind;
    }

    public PartOfBody getBody() {
        return body;
    }

    public void setBody(PartOfBody body) {
        this.body = body;
    }

    public Factor getFactor() {
        return factor;
    }

    public void setFactor(Factor factor) {
        this.factor = factor;
    }

    public Medication getMedication() {
        return medication;
    }

    public void setMedication(Medication medication) {
        this.medication = medication;
    }

    public Date getStartLostTime() {return startLostTime; }

    public void setStartLostTime(Date startLostTime) {this.startLostTime = startLostTime;}

    public Date getEndLostTime() {return endLostTime;}

    public void setEndLostTime(Date endLostTime) {this.endLostTime = endLostTime;}

    public String getDayLost() {return dayLost;}

    public void setDayLost(String dayLost) {this.dayLost = dayLost; }

    public String getDayDebited() {return dayDebited;}

    public void setDayDebited(String dayDebited) {this.dayDebited = dayDebited;}

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public Accident toEntity() {
        Accident accident = new Accident();
        accident.setAccidentType(getAccidentType());
        accident.setBody(getBody());
        accident.setAssigned(getAssigned());
        accident.setFactor(getFactor());
        accident.setFrecuency(getFrecuency());
        accident.setKind(getKind());
        accident.setMedication(getMedication());
        accident.setReceive(getReceive());
        accident.setSeverity(getSeverity());
        accident.setTurn(getTurn());
        accident.setWay(getWay());
        accident.setCause(getCause());
        accident.setStartLostTime(getStartLostTime());
        accident.setEndLostTime(getEndLostTime());
        accident.setDayLost(getDayLost());
        accident.setDayDebited(getDayDebited());
        accident.setDateInit(getDateInit());
        accident.setStartLostTime(getStartLostTime());

        return accident;
    }

    @Override
    public void updateFromEntity(Accident entity) {
        setAccidentType(entity.getAccidentType());
        setAssigned(entity.getAssigned());
        setFactor(entity.getFactor());
        setBody(entity.getBody());
        setFrecuency(entity.getFrecuency());
        setKind(entity.getKind());
        setMedication(entity.getMedication());
        setReceive(entity.getReceive());
        setSeverity(entity.getSeverity());
        setTurn(entity.getTurn());
        setWay(entity.getWay());
        setCause(entity.getCause());
        setStartLostTime(entity.getStartLostTime());
        setEndLostTime(entity.getEndLostTime());
        setDayLost(entity.getDayLost());
        setDayDebited(entity.getDayDebited());
        setDateInit(entity.getDateInit());
        setStartLostTime(entity.getStartLostTime());
        setEmployeeId(entity.getEmployee().getId());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(EmployeeController.class).findById(getEmployeeId())).withRel("employee"));
    }
}
