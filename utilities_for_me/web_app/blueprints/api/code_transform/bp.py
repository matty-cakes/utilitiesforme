from flask import Blueprint, request

from utilities_for_me.utilities._case_transform.case_transform import transform

bp = Blueprint("code-transform", __name__, url_prefix="/api/v1/code-transform")


@bp.route("", methods=["POST"])
def code_transform():
    contents = request.get_json(silent=True).get("contents", "")
    from_case = request.get_json(silent=True).get("from_case", "")
    to_case = request.get_json(silent=True).get("to_case", "")

    data = transform(from_case, to_case, contents)
    return {"data": data}
