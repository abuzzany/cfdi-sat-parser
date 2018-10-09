# frozen_string_literal: true

module CfdiSat
  module V33
    module LineIntems
      # Esta clase mapea los atributos del nodo
      # 'Concepto#Impuestos#Traslados#Traslado' y los devuelve en forma de Hash.
      class TransferredTaxXml < CfdiSat::V33::BaseTransferredTaxXml
        private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Traslado' a su correspondiente
        # Key en ingles.
        def attr
          super.merge(base: 'Base')
        end
      end
    end
  end
end
