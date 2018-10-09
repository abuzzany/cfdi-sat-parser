# frozen_string_literal: true

module CfdiSat
  module V33
    module LineIntems
      # Esta clase mapea los atributos del nodo
      # 'Concepto#Impuestos#Retenciones#Retencion' y los devuelve en forma
      # de Hash.
      class RetainedTaxXml < CfdiSat::V33::BaseRetainedTaxXml
        private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Retencion' a su correspondiente
        # Key en ingles.
        def attr
          super.merge(
            rate: 'TasaOCuota',
            factory_type: 'TipoFactor',
            base: 'Base'
          )
        end
      end
    end
  end
end
