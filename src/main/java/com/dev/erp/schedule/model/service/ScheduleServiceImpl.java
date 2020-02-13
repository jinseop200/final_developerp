package com.dev.erp.schedule.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.schedule.model.dao.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
@Autowired ScheduleDAO scheduleDAO;
}
