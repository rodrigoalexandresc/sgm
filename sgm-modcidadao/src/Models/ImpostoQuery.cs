using System;
using System.Collections.Generic;

namespace ModCidadao.Models {
    public class ImpostoQuery {
        public string CPFouCNPJ { get; set; }
        public int InscricaoImovel { get; set; }
        public DateTime? DataConsulta { get; set; }

        public bool IsValid() {
            return !string.IsNullOrEmpty(CPFouCNPJ)
                && InscricaoImovel >= 0
                && DataConsulta != null;
        }

        public IEnumerable<string> Errors() {
            if (IsValid()) return null;

            var errors = new List<string>();

            if (string.IsNullOrEmpty(CPFouCNPJ))
                errors.Add("CPF ou CNPJ inválido");

            if (InscricaoImovel <= 0) 
                errors.Add("Inscrição do imóvel inválida");

            if (DataConsulta == null)
                errors.Add("Data de consulta não preenchida");

            return errors;            
        }
    }
}