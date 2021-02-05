using System;

namespace ModIntegracao.Models {
    public class Imposto {
        public Guid ImpostoId { get; set; }
        public DateTime DataVencimento { get; set; }
        public int InscricaoImovel { get; set; }
        public decimal AreaTerreno { get; set; }
        public decimal Valor { get; set; }
    }
}