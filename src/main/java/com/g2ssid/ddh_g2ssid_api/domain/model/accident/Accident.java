package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;


import javax.persistence.*;
import java.util.Date;


/**
 * @author Michel Terrazas Mercado
 */

@Entity
@Table(name = "accident")
public class Accident extends BaseEntityAudit {

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

    /*tipo de accidente Dropdown*/
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private AccidentType accidentType;

    //descripción de accidente Text
    @Column(nullable = false)
    private String cause;

    //fecha de accidente DatePiker
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateInit;

    //evaluación de lesión Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private Severity severity;

    //recibió primeros auxilios Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private Receive receive;

    //reasigando a otra función Radiobutton
    @Enumerated(value = EnumType.STRING)
    @Column(length = 8)
    private Assigned assigned;

    //Reincidencia RadioButton
    @Enumerated(value = EnumType.STRING)
    @Column(length = 8)
    private Frecuency frecuency;


    //Turno Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private Turn turn;

    //Formas de accidente Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private WayType way;

    //Tipo de lesión Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private KindType kind;

    //parte del cuerpo lesionada Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private PartOfBody body;

    //Agente causante Dropdown
    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private Factor factor;

    //Hubo tratamiento medico? RadioButton
    @Enumerated(value = EnumType.STRING)
    @Column(length = 8)
    private Medication medication;

    //Inicio tiempo perdido Datepicker
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date startLostTime;

    //Fin tiempo perdido Datepicker
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date endLostTime;

    //Dias perdidos Text
    @Column(nullable = false)
    private String dayLost;

    //Dias debitados Text
    @Column(nullable = false)
    private String dayDebited;


    //sets and gets

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

    public Date getDateInit(){
        return dateInit;
    }

    public void setDateInit(Date dateInit){
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

    public Date getStartLostTime() {
        return startLostTime;
    }

    public void setStartLostTime(Date startLostTime) {
        this.startLostTime = startLostTime;
    }

    public Date getEndLostTime(){
        return endLostTime;
    }

    public void setEndLostTime(Date endLostTime) { this.endLostTime = endLostTime; }

    public String getDayLost() {
        return dayLost;
    }

    public void setDayLost(String dayLost) {
        this.dayLost = dayLost;
    }

    public String getDayDebited() {
        return dayDebited;
    }

    public void setDayDebited(String dayDebited) {
        this.dayDebited = dayDebited;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    //merge
    public void merge(Accident newAccident) {
        if(newAccident.getAccidentType() != null) {
            this.setAccidentType(newAccident.getAccidentType());
        }
        if (newAccident.getCause() != null) {
            this.setCause(newAccident.getCause());
        }
        if (newAccident.getDateInit() != null) {
            this.setDateInit(newAccident.getDateInit());
        }
        if (newAccident.getSeverity() != null) {
            this.setSeverity(newAccident.getSeverity());
        }
        if (newAccident.getReceive() != null) {
            this.setReceive(newAccident.getReceive());
        }
        if (newAccident.getAssigned() != null) {
            this.setAssigned(newAccident.getAssigned());
        }
        if (newAccident.getFrecuency() != null) {
            this.setFrecuency(newAccident.getFrecuency());
        }
        if(newAccident.getTurn() != null) {
            this.setTurn(newAccident.getTurn());
        }
        if(newAccident.getWay() != null) {
            this.setWay(newAccident.getWay());
         }
        if(newAccident.getKind() != null) {
            this.setKind(newAccident.getKind());

        }if(newAccident.getBody() != null) {
            this.setBody(newAccident.getBody());
        }
        if(newAccident.getFactor() != null) {
            this.setFactor(newAccident.getFactor());
        }
        if(newAccident.getMedication() != null) {
            this.setMedication(newAccident.getMedication());
        }
        if(newAccident.getStartLostTime() != null) {
            this.setStartLostTime(newAccident.getStartLostTime());
        }
        if(newAccident.getEndLostTime() != null) {
            this.setEndLostTime(newAccident.getEndLostTime());
        }
        if(newAccident.getDayLost() != null) {
            this.setDayLost(newAccident.getDayLost());
        }
        if(newAccident.getDayDebited() != null) {
            this.setDayDebited(newAccident.getDayDebited());
        }

        }

    }
