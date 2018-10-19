# frozen_string_literal: true

require 'cfdi_sat/v33/node'

module CfdiSat
  module Complements
    # Esta clase mapea los atributos del nodo 'Comprobante#Complemento#Nomina'
    # y los devuelve en forma de Hash.
    class PayrollXml < CfdiSat::V33::Node
      private

      # Los siguientes metodos sobreescriben a su declaración en la clase
      # padre Node.

      # Mapea los atributos del nodo 'Nomina' a su correspondiente
      # Key en ingles.
      def attr
        {
          version: 'Version',
          employee_number: 'NumEmpleado',
          curp: 'CURP',
          tax_classification: 'TipoRegimen',
          social_security_number: 'NumSeguridadSocial',
          payment_date: 'FechaPago',
          starting_payment_period: 'FechaInicialPago',
          ending_payment_period: 'FechaFinalPago',
          paid_days: 'NumDiasPagados',
          departament: 'Departamento',
          clabe: 'CLABE',
          bank: 'Banco',
          hiring_date: 'FechaInicioRelLaboral',
          antique: 'Antiguedad',
          job_position: 'Puesto',
          contract_type: 'TipoContrato',
          work_day_type: 'TipoJornada',
          payment_interval: 'PeriodicidadPago',
          base_salary: 'SalarioBaseCotApor',
          risk_category: 'RiesgoPuesto',
          daily_wage: 'SalarioDiarioIntegrado',
          patronal_register: 'RegistroPatronal',
          payroll_type: 'TipoNomina'
        }
      end

      # Mapea los atributos del monetarios nodo 'Nomina'
      # a su correspondienteKey en ingles ademas de ser convertidos
      # a centavos.
      def attr_money
        {
          perceptions_total_cents: 'TotalPercepciones',
          deductions_total_cents: 'TotalDeducciones',
          other_payments_total_cents: 'TotalOtrosPagos'
        }
      end
    end
  end
end
