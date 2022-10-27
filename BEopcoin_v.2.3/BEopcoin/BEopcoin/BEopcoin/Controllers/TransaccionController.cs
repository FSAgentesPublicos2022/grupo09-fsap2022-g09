using BEopcoin._Transaccion;
using BEopcoin._Transaccion.DTOs;
using BEopcoin._Transaccion.Requests;
using BEopcoin._Transaccion.Responses;
using System.Web.Http;
using System.Web.Http.Description;

namespace BEopcoin.Controllers
{
    [Authorize()]
    public class TransaccionController : ApiController
    {
        private Model1 db = new Model1();

        // POST: api/transaccion/comprar
        [ResponseType(typeof(ComprarResponse))]
        public IHttpActionResult Comprar(ComprarRequest comprarRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            ComprarDto comprarDto = new ComprarDto
            {
                CuentaDebito = comprarRequest.CuentaDebito,
                CuentaCredito = comprarRequest.CuentaCredito,
                Importe = comprarRequest.Importe
            };

            ComprarCtrl comprarCtrl = new ComprarCtrl(db);
            comprarCtrl.Process(comprarDto);

            ComprarResponse comprarResponse = new ComprarResponse
            {
                SaldoCuentaDebito = comprarCtrl.GetSaldoCuentaDebito(),
                SaldoCuentaCredito = comprarCtrl.GetSaldoCuentaCredito(),
                ImporteCompradoEnTipoMoneda = comprarCtrl.GetImporteCompradoEnTipoMoneda(),
                FechaTransaccion = comprarCtrl.GetFechaTransacion()
            };

            return Ok(comprarResponse);
        }

        // POST: api/transaccion/vender
        [ResponseType(typeof(VenderResponse))]
        public IHttpActionResult Vender(VenderRequest venderRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            VenderDto venderDto = new VenderDto
            {
                CuentaDebito = venderRequest.CuentaDebito,
                CuentaCredito = venderRequest.CuentaCredito,
                Importe = venderRequest.Importe
            };

            VenderCtrl venderCtrl = new VenderCtrl(db);
            venderCtrl.Process(venderDto);

            VenderResponse venderResponse = new VenderResponse
            {
                SaldoCuentaDebito = venderCtrl.GetSaldoCuentaDebito(),
                SaldoCuentaCredito = venderCtrl.GetSaldoCuentaCredito(),
                ImporteVendidoEnTipoMoneda = venderCtrl.GetImporteVendidoEnTipoMoneda(),
                FechaTransaccion = venderCtrl.GetFechaTransacion()
            };

            return Ok(venderResponse);
        }

        // POST: api/transaccion/convertir
        [ResponseType(typeof(ConvertirResponse))]
        public IHttpActionResult Convertir(ConvertirRequest convertirRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            ConvertirDto convertirDto = new ConvertirDto
            {
                CuentaDebito = convertirRequest.CuentaDebito,
                CuentaCredito = convertirRequest.CuentaCredito,
                Importe = convertirRequest.Importe
            };

            ConvertirCtrl convertirCtrl = new ConvertirCtrl(db);
            convertirCtrl.Process(convertirDto);

            ConvertirResponse convertirResponse = new ConvertirResponse
            {
                SaldoCuentaDebito = convertirCtrl.GetSaldoCuentaDebito(),
                SaldoCuentaCredito = convertirCtrl.GetSaldoCuentaCredito(),
                ImporteConvertido = convertirCtrl.GetImporteConvertido(),
                FechaTransaccion = convertirCtrl.GetFechaTransacion()
            };

            return Ok(convertirResponse);
        }
       
        // GET: api/transaccion/saldoctapesos/5
        [HttpGet]
        [ResponseType(typeof(SaldoResponse))]
        public IHttpActionResult SaldoCtaPesos(int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Billetera billetera = db.Billetera.Find(id);    

            SaldoResponse saldoResponse = new SaldoResponse
            {
                Saldo = billetera.SaldoCliente

            };
            return Ok(saldoResponse);
        }

        // POST: api/transaccion/saldoctapesosdto
        [ResponseType(typeof(SaldoResponse))]
        public IHttpActionResult SaldoCtaPesosDto(SaldoRequest saldoRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            Billetera billetera = db.Billetera.Find(saldoRequest.Cuenta);

            SaldoResponse saldoResponse = new SaldoResponse
            {
                Saldo = billetera.SaldoCliente

            };
            return Ok(saldoResponse);
        }

    }
}
